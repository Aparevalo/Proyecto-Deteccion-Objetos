import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Importa la librería provider
import 'package:reconocer/modelo/loginModel.dart';  // Ajusta la importación según la ubicación real de tu AuthProvider
import 'package:reconocer/vista/createUser/createUserForm.dart';
import 'package:reconocer/vista/login/loginForm.dart';
import 'package:reconocer/vista/homePage/homePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),  // Ajusta según el tipo de provider que estés utilizando
        // Otros providers aquí si los tienes
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registro',
      routes: {
        '/registro': (context) => CreateUserForm(),
        '/login': (context) => LoginUserForm(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
