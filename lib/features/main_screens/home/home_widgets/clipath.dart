import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveHeight = 30.0;

    path.lineTo(size.width * 0.08, 0); // Top-left to 70% width
    path.quadraticBezierTo(size.width, size.height * 0.1, size.width, size.height * 0.3); // Top-right curve
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(size.width, size.height * 0.9, size.width * 0.7, size.height); // Bottom-right curve
    path.lineTo(size.width * 0.3, size.height);
    path.quadraticBezierTo(0, size.height * 0.9, 0, size.height * 0.7); // Bottom-left curve
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(0, size.height * 0.1, size.width * 0.3, 0); // Top-left curve
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
