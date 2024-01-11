class UserModel {
  String nombre;
  String apellido;
  String telefono;
  String email;
  String contrasena;

  UserModel({
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.contrasena,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'contrasena': contrasena,
    };
  }
}
