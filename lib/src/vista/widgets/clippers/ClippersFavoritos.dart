import 'package:flutter/material.dart';

class ClipperFavoritosTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0, size.width * 0.5, size.height);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0, 0, size.height);
    path.lineTo(0, size.height);
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

class ClipperFavoritosBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.75, size.width * 0.5, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.75, 0, 0);

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
