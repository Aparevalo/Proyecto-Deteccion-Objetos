// userOperations.dart
import 'package:flutter/material.dart';
import 'package:reconocer/modelo/userModel.dart';
import 'package:reconocer/rest/loginRest.dart';
import 'loginFormFields.dart';
import 'package:reconocer/widgets/alertDialog.dart';

class LoginUserOperations {
  static Future<void> loginUser(BuildContext context, GlobalKey<FormState> formKey, LoginUserFormFields formFields) async {
    if (formKey.currentState!.validate()) {
      UserModel user = UserModel(
        email: formFields.emailController.text,
        contrasena: formFields.contrasenaController.text,
      );

      AuthService controller = AuthService();
      bool verificarCorreo = await controller.verificarCorreo(user.email);
      bool verificarContrasena = await controller.verificarContrasena(user);
      
      if(!verificarCorreo){
        if(verificarContrasena){
          bool success = await controller.login(verificarContrasena);
          if (success) {
        // Navegar a la pantalla de inicio después de iniciar sesión exitosamente
            Navigator.pushReplacementNamed(context, '/home', arguments: user.email);
          } else {
            CustomAlertDialog.showAlert(context, 'Error', 'Error al iniciar sesión', Colors.red);
          }
        }else{
          CustomAlertDialog.showAlert(context, 'Error', 'Contrasena Incorrecta', Colors.red);
        }
      }else{
          CustomAlertDialog.showAlert(context, 'Error', 'Correo no registrado', Colors.red);
      }
         
     
    }
  }

  static void logoutUser(BuildContext context) {
    // Limpiar cualquier información de sesión y volver al formulario de inicio de sesión
    AuthService controller = AuthService();
    controller.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  
  static Future<bool> checkLoggedInStatus() async {
    // Comprobar si el usuario está autenticado
    AuthService controller = AuthService();
    return await controller.checkLoggedInStatus();
  }
}
