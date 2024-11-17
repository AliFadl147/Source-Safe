import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.05, 0); // Start from top-left
    path.quadraticBezierTo(size.width - size.width / 1.3, size.height * 0.7,
        size.width * 0.9, size.height);
    //path.lineTo(size.width * 0.9, size.height); // Diagonal cut
    path.lineTo(size.width, size.height); // Top-right
    path.lineTo(size.width, 0); // Back to start
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}