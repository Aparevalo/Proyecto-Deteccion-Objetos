import 'package:flutter/material.dart';
import 'package:reconocer/modelo/userModel.dart'; 
import 'package:reconocer/controlador/userController.dart'; 

class CreateUserForm extends StatefulWidget {
  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _createUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
        nombre: nombreController.text,
        apellido: apellidoController.text,
        telefono: telefonoController.text,
        email: emailController.text,
        contrasena: contrasenaController.text,
      );

      UserController controller = UserController();
      bool success = await controller.createUser(user);

      if (success) {
        _showAlert(context, 'Éxito', 'Usuario creado con éxito', Colors.green);
      } else {
        _showAlert(context, 'Error', 'Error al crear el usuario', Colors.red);
      }
    }
  }

  void _showAlert(BuildContext context, String title, String message, Color color) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el nombre.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: apellidoController,
              decoration: InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el apellido.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Teléfono'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el teléfono.';
                }
                return null;
              },
            ),
            TextFormField(
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
            ),
            TextFormField(
              controller: contrasenaController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese la contraseña.';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _createUser(context),
              child: Text('Crear Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
