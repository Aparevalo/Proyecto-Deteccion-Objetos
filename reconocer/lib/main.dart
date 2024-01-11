import 'package:flutter/material.dart';
import 'package:reconocer/vista/createUserForm.dart'; 

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

