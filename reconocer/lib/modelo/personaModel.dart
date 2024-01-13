import 'package:reconocer/modelo/userModel.dart';

class PersonaModel extends UserModel {
  String nombre;
  String apellido;
  String telefono;

  PersonaModel({
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required String email,
    required String contrasena,
  }) : super(email: email, contrasena: contrasena);

  @override
  Map<String, dynamic> toJson() {
    // Puedes sobrescribir el método toJson para incluir los atributos de la clase base (User)
    Map<String, dynamic> json = super.toJson();
    json['nombre'] = nombre;
    json['apellido'] = apellido;
    json['telefono'] = telefono;
    return json;
  }
}