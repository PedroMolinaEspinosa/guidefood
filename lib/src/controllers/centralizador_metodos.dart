import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/colores.dart';

Color getIconColorDificultad(String dificultad) {
  switch (dificultad) {
    case "Baja":
      return primaryColorLight;
      break;
    case "Media":
      return Colors.orangeAccent;
      break;
    case "Alta":
      return Colors.red;
      break;
  }
}

Image getIconCalificacion(double calificacion) {
  if (calificacion < 2.0)
    return Image(
      image: AssetImage("assets/iconos/heart0.png"),
    );
  if (calificacion >= 2.0 && calificacion < 4.0)
    return Image(
      image: AssetImage("assets/iconos/heart25.png"),
    );
  if (calificacion >= 4.0 && calificacion < 6.0)
    return Image(
      image: AssetImage("assets/iconos/heart50.png"),
    );
  if (calificacion >= 6.0 && calificacion < 9.0)
    return Image(
      image: AssetImage("assets/iconos/heart75.png"),
    );
  if (calificacion >= 9.0)
    return Image(
      image: AssetImage("assets/iconos/heart100.png"),
    );
}
