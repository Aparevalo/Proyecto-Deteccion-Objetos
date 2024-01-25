// home_screen_operations.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reconocer/rest/imagenRest.dart';
import 'package:reconocer/widgets/alertDialog.dart';

class HomeScreenOperations {
  static Future<void> iniciarAccion(BuildContext context, String email) async {
    // Muestra un cuadro de diálogo con las opciones de cámara o galería
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar fuente de imagen'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: Text('Cámara'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: Text('Galería'),
            ),
          ],
        );
      },
    );

    // Verifica si el usuario seleccionó una fuente de imagen
    if (source != null) {
      // Usa image_picker para tomar una foto o seleccionar de la galería
      final pickedFile = await ImagePicker().getImage(source: source);

      // Realiza acciones con la imagen seleccionada (puede ser guardar, mostrar, etc.)
      if (pickedFile != null) {
        // Aquí puedes realizar acciones con la imagen seleccionada
        bool success = await ImagenRest.enviarImagen(pickedFile.path, email);
          if (success) {
            Navigator.pushReplacementNamed(context, '/reconocer', arguments: pickedFile.path);
            
          }else {
            CustomAlertDialog.showAlert(context, 'Error', 'No se pudo enviar la imagen', Colors.red);
          }
        
        print('Imagen enviada y procesada correctamente');
      }
    }
  }
}
