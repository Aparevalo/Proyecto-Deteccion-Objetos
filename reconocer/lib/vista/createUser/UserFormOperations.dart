import 'package:flutter/material.dart';
import 'package:reconocer/modelo/personaModel.dart';
import 'package:reconocer/rest/createUserRest.dart';
import 'userFormFields.dart';
import 'package:reconocer/widgets/alertDialog.dart';

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

            CustomAlertDialog.showAlert(context, 'Éxito', 'Usuario creado con éxito', Colors.green);
            Navigator.pushReplacementNamed(context, '/login');
          } else {
           CustomAlertDialog.showAlert(context, 'Error', 'Error al crear el usuario', Colors.red);
          }
        }else {
         CustomAlertDialog.showAlert(context, 'Error', 'El telefono ya está registrado', Colors.red);
        }  
      } else {
        CustomAlertDialog.showAlert(context, 'Error', 'El correo ya está registrado', Colors.red);
      }
    }
  }

  
}
