// userController.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reconocer/modelo/userModel.dart';

class UserController {


  Future<bool> createUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/createUser.php'),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<bool> verificarCorreo(String correo) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/verificarCorreo.php'),
      body: {'email': correo},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

Future<bool> verificarTelefono(String telefono) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/verificarTelefono.php'),
      body: {'telefono': telefono},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

}
