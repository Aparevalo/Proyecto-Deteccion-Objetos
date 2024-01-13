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

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Column(
              children: [
                CustomPaint(
                  painter: LoginFivePainter(),
                  child: Container(
                    height: 100,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!isKeyboardVisible)
                            Text(
                              'Registrarse',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          SizedBox(height: 16),
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
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () =>
                                      UserOperations.createUser(context, _formKey, formFields),
                                  child: Text('Crear Usuario'),
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
            );
          },
        ),
      ),
    );
  }
}