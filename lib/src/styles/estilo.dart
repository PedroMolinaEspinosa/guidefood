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
Color primaryColor = Color(0xFFF8F8FF0);
Color primaryColorLight = Colors.indigo[100];
Color primaryColorDark = Colors.indigo[900];
Color accentColor = Colors.orange;

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

TextStyle paragraphTextStyle = TextStyle(fontSize: 18, color: black);
