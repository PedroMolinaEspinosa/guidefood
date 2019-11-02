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
Color primaryColorDark = Color.fromRGBO(19, 32, 1, 0.8);
Color accentColor = Color.fromRGBO(62, 106, 3, 0.8);
Color marron = Color.fromRGBO(124, 62, 14, 0.8);
Color black = Colors.black;
Color white = Colors.white;

TextStyle loginFormTextStyle =
    TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: primaryColor);

TextStyle loginButtonTextStyle = loginFormTextStyle.copyWith(
    color: white, fontSize: 24.0, fontWeight: FontWeight.bold);

TextStyle buttonTextStyle = TextStyle(
    color: primaryColor,
    fontSize: 14.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);

TextStyle titleTextStyle = TextStyle(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    fontSize: 20);

TextStyle nameTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: accentColor);

TextStyle email = TextStyle(
  fontSize: 20,
  color: primaryColor,
);
TextStyle titleTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorDark,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle calificationTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorLight,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
TextStyle textTile = TextStyle(
  decoration: TextDecoration.none,
  color: primaryColorLight,
  fontSize: 12,
);
TextStyle paragraphTextStyle = TextStyle(fontSize: 18, color: black);
