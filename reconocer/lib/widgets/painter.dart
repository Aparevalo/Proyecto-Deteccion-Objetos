import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(150.0, 50.0), radius: 180);

    final Gradient gradient = new LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff149e8e),
        Color(0xff36ea7d)
      ],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * .1, size.height * .8, size.width * .25, size.height * .85);
    path.quadraticBezierTo(size.width * .4, size.height * .9, size.width * .5, size.height * .75);
    path.quadraticBezierTo(size.width * .488, size.height * .77, size.width * .6, size.height * .6);
    path.quadraticBezierTo(size.width * .7, size.height * .5, size.width * .8, size.height * .55);
    path.quadraticBezierTo(size.width * .9, size.height * .6, size.width, size.height * .55);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}





// Bottom Register

class BottomPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(center: Offset(150.0, 50.0), radius: 180);

    final Gradient gradient = new LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff149e8e),
        Color(0xff36ea7d)
      ]
    );


    final paint = new Paint().. shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo( 0, size.height * .85);   
    path.quadraticBezierTo( size.width * .28 , size.height * .98, size.width * .48 , size.height * .85 );
    path.quadraticBezierTo( size.width * .9 , size.height * .5, size.width , size.height * .5 );
    path.lineTo(size.width, size.height);  
   

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}