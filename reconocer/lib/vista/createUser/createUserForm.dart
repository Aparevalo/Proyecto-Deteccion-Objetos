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
 bool isVisible = false; // Inicializa la variable isVisible con true

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        isVisible = visible; // Actualiza isVisible según la visibilidad del teclado
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
              painter: LoginFivePainter(),
              child: Container(
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: BottomRegisterFivePainter(),
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
                          // Muestra el título solo si el teclado no está presente
                          return isVisible
                              ? Container() // Puedes usar un contenedor vacío o cualquier otro widget para ocultar el título
                              : Text(
                                  'Registrarse',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                        },
                      ),
                      SizedBox(height: isVisible ? 0 : 14), // Ajusta el tamaño del espacio según la visibilidad del teclado
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
        ),
      ),
    );
  }
}