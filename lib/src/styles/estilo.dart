import 'package:flutter/material.dart';

ThemeData guidefoodTheme = new ThemeData(
    backgroundColor: white,
    canvasColor: white,
    hintColor: hintColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    accentColor: accentColor,
    fontFamily: "Roboto");

Color backgoroundColor = Colors.greenAccent;
Color hintColor = Colors.indigo;
Color primaryColor = Color(0xFF214703);
Color primaryColorLight = Color.fromRGBO(77, 129, 5, 0.8);
Color primaryColorDark = Color.fromRGBO(19, 32, 1, 1);
Color accentColor = Color.fromRGBO(62, 106, 3, 0.8);
Color marron = Color.fromRGBO(124, 62, 14, 0.4);
Color marron70 = Color.fromRGBO(124, 62, 14, 0.7);
Color marron85 = Color.fromRGBO(124, 62, 14, 0.7);
Color black = Colors.black;
Color white = Colors.white;
Color blanco90 = Color.fromRGBO(255, 255, 255, 0.9);
Color transparente = Colors.transparent;

TextStyle titleTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorDark,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle calificationTile = TextStyle(
  decoration: TextDecoration.none,
  color: black,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle textTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorLight,
  fontSize: 12,
);
TextStyle medianoTextStyle = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorLight,
  fontSize: 18,
);
TextStyle nombreDetalle = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorDark,
  fontWeight: FontWeight.bold,
  fontSize: 28,
);
TextStyle listaIntruccionesTextStyle = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorDark,
  fontWeight: FontWeight.bold,
  fontFamily: "Monserrat-Light",
  fontSize: 18,
);
TextStyle paragraphTextStyle = TextStyle(fontSize: 18, color: black);

class MontserratFontFamily {
  static const String medium = 'Montserrat-Medium';
  static const String light = 'Montserrat-Light';
  static const String bold = 'Montserrat-Bold';
  static const String regular = 'Montserrat-Medium';
  static const String black = "Montserrat-black";
  static const String semiBold = "Montserrat-SemiBold";
  static const String extraLight = "Montserrat-ExtraLight";
  static const String thin = "Montserrat-Thin";
}
