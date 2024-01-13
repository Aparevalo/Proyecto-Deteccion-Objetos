// home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reconocer/modelo/loginModel.dart';
import 'package:reconocer/rest/loginRest.dart';
import 'package:reconocer/vista/login/loginForm.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthService().logout();
              Provider.of<AuthProvider>(context, listen: false).logout();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginUserForm()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('¡Bienvenido!'),
      ),
    );
  }
}
