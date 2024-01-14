// loginUserForm.dart
import 'package:flutter/material.dart';
import 'loginFormFields.dart';
import 'loginFormOperations.dart';
import 'package:reconocer/widgets/painter.dart';

class LoginUserForm extends StatefulWidget {
  @override
  _LoginUserFormState createState() => _LoginUserFormState();
}

class _LoginUserFormState extends State<LoginUserForm> {
  final LoginUserFormFields formFields = LoginUserFormFields();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            CustomPaint(
              painter: Painter(),
              child: Container(
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: BottomPainter(),
                child: Container(
                  height: 170,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            formFields.buildEmailField(),
                            formFields.buildPasswordField(),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () =>
                                  LoginUserOperations.loginUser(context, _formKey, formFields),
                              child: Text('Iniciar Sesión'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
