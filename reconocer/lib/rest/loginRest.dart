import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reconocer/modelo/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login(UserModel user) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/createUser.php'),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      final bool loginSuccess = json.decode(response.body);

      if (loginSuccess) {
        // Almacenar el estado de la sesión en SharedPreferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
      }

      return loginSuccess;
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

  Future<void> logout() async {
    // Limpiar el estado de la sesión en SharedPreferences al cerrar sesión
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }

  Future<bool> checkLoggedInStatus() async {
    // Comprobar si el usuario está autenticado consultando SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
