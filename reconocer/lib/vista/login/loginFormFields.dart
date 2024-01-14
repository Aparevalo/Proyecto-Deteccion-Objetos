// form_fields.dart
import 'package:flutter/material.dart';

class LoginUserFormFields {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  

  TextFormField buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el email.';
        }
        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value)) {
          return 'Por favor, ingrese un email válido.';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: contrasenaController,
      decoration: InputDecoration(labelText: 'Contraseña'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese la contraseña.';
        }
        return null;
      },
    );
  }

  
}
