import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/colores.dart';

ThemeData guidefoodTheme = new ThemeData(
    backgroundColor: white,
    canvasColor: white,
    hintColor: hintColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    accentColor: accentColor,
    fontFamily: "Roboto");

TextStyle titleTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorDark,
  fontWeight: FontWeight.bold,
  fontFamily: MontserratFontFamily.semiBold,
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
  fontFamily: "Golden-Hills",
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
  static const String regular = 'Montserrat-Regular';
  static const String black = "Montserrat-Black";
  static const String semiBold = "Montserrat-SemiBold";
  static const String extraLight = "Montserrat-ExtraLight";
  static const String thin = "Montserrat-Thin";
}
