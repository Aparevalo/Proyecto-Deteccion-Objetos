import 'package:flutter/material.dart';
import 'package:reconocer/vista/createUser/createUserForm.dart';
import 'package:reconocer/vista/login/loginForm.dart'; // Ajusta el import según la ubicación real de tu archivo
import 'package:reconocer/vista/homePage/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registro',
      routes: {
        '/registro': (context) => CreateUserForm(),
        '/login': (context) => LoginUserForm(), 
        '/home':(context) => HomeScreen(),
      },
    );
  }
}
