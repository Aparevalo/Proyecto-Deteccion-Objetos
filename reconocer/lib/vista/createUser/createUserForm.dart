import 'package:flutter/material.dart';
import 'userFormFields.dart';
import 'userFormOperations.dart';
import 'package:reconocer/widgets/painter.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CreateUserForm extends StatefulWidget {
  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
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
                      KeyboardVisibilityBuilder(
                        builder: (context, _isVisible) {
                          return isVisible
                              ? Container()
                              : Text(
                                  'Registrarse',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                        },
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            formFields.buildNameField(),
                            formFields.buildLastNameField(),
                            formFields.buildPhoneField(),
                            formFields.buildEmailField(),
                            formFields.buildPasswordField(),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () => UserOperations.createUser(context, _formKey, formFields),
                              child: Text('Crear Usuario'),
                            ),
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                '¿Ya tienes una cuenta? Inicia sesión aquí',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
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
