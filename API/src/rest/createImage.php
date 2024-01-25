<?php
require_once '../modelo/user.php';
require_once '../modelo/imagen.php';
require_once '../modelo/conexionBD.php';
require_once '../queries/sql.php';


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $uploads_dir = 'upload';

    $db = new conexionBD();
	  $conn=$db->get_con();

    // Verifica si el archivo de imagen fue enviado correctamente
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] == UPLOAD_ERR_OK) {
        $nombreArchivo = basename($_FILES['imagen']['name']);
        $rutaArchivo = $uploads_dir ."/". $nombreArchivo;

        // Mueve el archivo temporal al directorio de destino
        if (move_uploaded_file($_FILES['imagen']['tmp_name'], $rutaArchivo)) {
          echo "Imagen recibida y guardada correctamente. Ruta: $rutaArchivo";
          $id = buscarIdUsuario($conn, $nombreArchivo);
          if($id){
          $imagen = new Imagen($nombreArchivo, $rutaArchivo, $id);
          $resultado = crearImagen($conn, $imagen);
            if ($resultado) {
            echo json_encode(true);
            } else {
            echo json_encode(false);
            }
          }else{
            echo false;//Error al encontrar usuario
          }

        } else {
            echo false;//Error al mover el archivo temporal
        }
    } else {
        echo false;//Error al recibir la imagen
    }
} else {
    echo false; //"Método no permitido."
}

?>
    