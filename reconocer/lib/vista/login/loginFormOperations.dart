// userOperations.dart
import 'package:flutter/material.dart';
import 'package:reconocer/modelo/userModel.dart';
import 'package:reconocer/rest/loginRest.dart';
import 'loginFormFields.dart';

class UserOperations {
  static Future<void> loginUser(BuildContext context, GlobalKey<FormState> formKey, UserFormFields formFields) async {
    if (formKey.currentState!.validate()) {
      UserModel user = UserModel(
        email: formFields.emailController.text,
        contrasena: formFields.contrasenaController.text,
      );

      AuthService controller = AuthService();
      bool success = await controller.login(user);
      
      if (success) {
        // Navegar a la pantalla de inicio después de iniciar sesión exitosamente
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showAlert(context, 'Error', 'Error al iniciar sesión', Colors.red);
      }
    }
  }

  static void logoutUser(BuildContext context) {
    // Limpiar cualquier información de sesión y volver al formulario de inicio de sesión
    AuthService controller = AuthService();
    controller.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  static void _showAlert(BuildContext context, String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          backgroundColor: color,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static Future<bool> checkLoggedInStatus() async {
    // Comprobar si el usuario está autenticado
    AuthService controller = AuthService();
    return await controller.checkLoggedInStatus();
  }
}
