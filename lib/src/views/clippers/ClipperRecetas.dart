import 'package:flutter/material.dart';

class CustomClipperComment extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.925, 0);
    path.quadraticBezierTo(
        size.width * 0.985, size.height * 0.025, size.width, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.80);

    path.quadraticBezierTo(size.width * 0.985, size.height * 0.975,
        size.width * 0.92, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.025, size.height * 0.75,
        size.width * 0.025, size.height * 0.3);

    path.quadraticBezierTo(
        size.width * 0.025, size.height * 0.02, size.width * 0.10, 0);
    path.close();

    //path.lineTo(x, y)
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
