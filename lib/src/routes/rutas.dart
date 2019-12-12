import 'package:flutter/material.dart';
import 'package:guidefood/src/vista/pages/detalle_page.dart';
import 'package:guidefood/src/vista/pages/favoritos_page.dart';
import 'package:guidefood/src/vista/pages/listado_recetas.dart';
import 'package:guidefood/src/vista/pages/login_page.dart';
import 'package:guidefood/src/vista/pages/selector_page.dart';
import 'package:guidefood/src/vista/pages/splash_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SplashPage(),
    'detalle': (BuildContext context) => DetallePage(),
    'selector': (BuildContext context) => SelectorPage(),
    'listado': (BuildContext context) => ListadoRecetasPage(),
    'login': (BuildContext context) => LoginPage(),
    'favoritos': (BuildContext context) => FavoritosPage(),
    'splash': (BuildContext context) => SplashPage()
  };
}
