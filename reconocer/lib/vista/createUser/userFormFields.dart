// form_fields.dart
import 'package:flutter/material.dart';

class UserFormFields {
  
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  TextFormField buildNameField() {
    return TextFormField(
      controller: nombreController,
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el nombre.';
        }
        return null;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      controller: apellidoController,
      decoration: InputDecoration(labelText: 'Apellido'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el apellido.';
        }
        return null;
      },
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      controller: telefonoController,
      decoration: InputDecoration(labelText: 'Teléfono'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese el teléfono.';
        }
        return null;
      },
    );
  }

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
