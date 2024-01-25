<?php
// index.php

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the data sent from the JavaScript code
    $data = json_decode(file_get_contents("php://input"), true);

    // Process the data as needed
    // For example, you can store it in a database or perform other actions

    // Display the received data on the webpage
    $response = array('status' => 'success', 'html' => 'Data received by PHP: ' . htmlspecialchars($data['message']));
    echo json_encode($response);


    // Terminate the script to prevent further output
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Webpage</title>
    <!-- Include TensorFlow.js and MobileNet.js scripts here -->
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@4.13.0/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/mobilenet@2.1.1"></script>
</head>
<body>

<script>
let model;

function displayDescription(prediction) {
  if (prediction.probability > 0.2) {
    const probability = Math.round(prediction.probability * 100);
    const message = `${probability}% De probabilidad que es ${prediction.className.replace(',', ' o')}`;
    sendToPHP(message);
  } else {
    sendToPHP('No estoy seguro de lo que es');
  }
}

function sendToPHP(message) {
  // Send the data to the same PHP script using AJAX
  const xhr = new XMLHttpRequest();
  const url = 'prueba.php'; // The same file

  xhr.open('POST', url, true);
  xhr.setRequestHeader('Content-Type', 'application/json');

  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // Handle the response from the PHP script if needed
      const response = JSON.parse(xhr.responseText);
      console.log(response.status);

      // Display the received data on the webpage
      document.getElementById('phpResponse').innerHTML = response.html;
    }
  };

  // Send the message to the PHP script
  xhr.send(JSON.stringify({ message: message }));
}

function classifyImage(image) {
  model.classify(image).then((predictions) => {
    // Assuming only one prediction is needed, use the first prediction
    const singlePrediction = predictions[0];
    displayDescription(singlePrediction);
  });
}

function loadImageAndClassify() {
  // Set a default image path
  const defaultImagePath = 'upload/imagen.jpg';

  // Create a new Image element
  const image = new Image();
  image.src = defaultImagePath;

  // Set up the image loading event
  image.onload = function () {
    // Classify the image
    classifyImage(image);
  };

  // Handle image loading error
  image.onerror = function () {
    throw Error('Error cargando la imagen');
  };
}

mobilenet.load().then((m) => {
  model = m;

  // Call loadImageAndClassify to load the default image and classify
  loadImageAndClassify();
});
</script>

<!-- Display the received data on the webpage -->
<div id="phpResponse"></div>

</body>
</html>
