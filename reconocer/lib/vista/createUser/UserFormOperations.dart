// userOperations.dart
import 'package:flutter/material.dart';
import 'package:reconocer/modelo/personaModel.dart';
import 'package:reconocer/rest/createUserRest.dart';
import 'userFormFields.dart';

class UserOperations {
  static Future<void> createUser(BuildContext context, GlobalKey<FormState> formKey, UserFormFields formFields) async {
    if (formKey.currentState!.validate()) {
      PersonaModel user = PersonaModel(
        nombre: formFields.nombreController.text,
        apellido: formFields.apellidoController.text,
        telefono: formFields.telefonoController.text,
        email: formFields.emailController.text,
        contrasena: formFields.contrasenaController.text,
      );

      UserController controller = UserController();
      bool verificarCorreo = await controller.verificarCorreo(user.email);
      bool verificarTelefono= await controller.verificarTelefono(user.telefono);
      if (verificarCorreo) {
        if(verificarTelefono){
          bool success = await controller.createUser(user);
          if (success) {

            _showAlert(context, 'Éxito', 'Usuario creado con éxito', Colors.green);
            Navigator.pushReplacementNamed(context, '/login');
          } else {
            _showAlert(context, 'Error', 'Error al crear el usuario', Colors.red);
          }
        }else {
          _showAlert(context, 'Error', 'El telefono ya está registrado', Colors.red);
        }  
      } else {
        _showAlert(context, 'Error', 'El correo ya está registrado', Colors.red);
      }
    }
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
}
