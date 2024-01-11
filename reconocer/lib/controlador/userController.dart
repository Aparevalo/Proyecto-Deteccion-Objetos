import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reconocer/modelo/userModel.dart'; 

class UserController {
  Future<bool> createUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/create_user.php'),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }
}
