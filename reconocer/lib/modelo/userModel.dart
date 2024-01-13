class UserModel {
  String email;
  String contrasena;

  UserModel({
    required this.email,
    required this.contrasena,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'contrasena': contrasena,
    };
  }
}