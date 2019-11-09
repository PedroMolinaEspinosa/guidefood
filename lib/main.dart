import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/routes/rutas.dart';
import 'package:guidefood/src/styles/estilo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setScreensControls();
    return MaterialApp(
      theme: guidefoodTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getAplicationRoutes(),
    );
  }
}
