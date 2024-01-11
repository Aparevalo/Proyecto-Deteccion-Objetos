import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crear Usuario'),
        ),
        body: CreateUserForm(),
      ),
    );
  }
}

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

  Future<void> _createUser() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://192.168.1.12:80/prueba_flutter/rest/create_user.php'),
        body: {
          'nombre': nombreController.text,
          'apellido': apellidoController.text,
          'telefono': telefonoController.text,
          'email': emailController.text,
          'contrasena': contrasenaController.text,
        },
      );

      if (response.statusCode == 200) {
        bool success = json.decode(response.body);
        if (success) {
          print('Usuario creado con éxito.');
        } else {
          print('Error al crear el usuario.');
        }
      } else {
        print('Error en la solicitud al servidor.');
      }
    }
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
              onPressed: _createUser,
              child: Text('Crear Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
