import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class ImagenRest {
  
  static Future<bool> enviarImagen(String imagePath, String name) async {
    var uri = Uri.parse("http://192.168.1.12:80/prueba_flutter/prueba_reconocer/prueba.php");
    var request = http.MultipartRequest("POST", uri);

    var bytes = await File(imagePath).readAsBytes();
    var imagenStream = http.ByteStream.fromBytes(bytes);

    var longitud = bytes.length;
    var multipartFile = http.MultipartFile('imagen', imagenStream, longitud, filename: name+".jpg");

    request.files.add(multipartFile);

    
      var response = await request.send();

      if (response.statusCode == 200) {
        print("Imagen enviada correctamente");
        return true;
      } else {
        print("Error al enviar la imagen. Código de estado: ${response.statusCode}");
        return false;
      }
    
  }

 static Future<String> verificarImagen(String correo) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.12:80/prueba_flutter/src/rest/verificarImagen.php'),
    body: {'email': correo},
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    // Return a default string or handle the error as needed
    return 'Error: ${response.statusCode}';
  }
}

static Future<String> prueba() async {
  final response = await http.get(
    Uri.parse('http://192.168.1.12:80/prueba_flutter/prueba_reconocer/prueba.php'),
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    // Return a default string or handle the error as needed
    return 'Error: ${response.statusCode}';
  }
}


}
