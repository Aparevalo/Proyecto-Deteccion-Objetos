// loginUserForm.dart
import 'package:flutter/material.dart';
import 'loginFormFields.dart';
import 'loginFormOperations.dart';
import 'package:reconocer/widgets/painter.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginUserForm extends StatefulWidget {
  @override
  _LoginUserFormState createState() => _LoginUserFormState();
}

class _LoginUserFormState extends State<LoginUserForm> {
  final UserFormFields formFields = UserFormFields();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        isVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      KeyboardVisibilityBuilder(
                        builder: (context, _isVisible) {
                          return isVisible
                              ? Container()
                              : Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                        },
                      ),
                      SizedBox(height: isVisible ? 12 : 0),
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
                                  UserOperations.loginUser(context, _formKey, formFields),
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
