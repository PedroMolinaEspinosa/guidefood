import 'package:flutter/material.dart';
import 'package:guidefood/src/vista/pages/detalle_page.dart';
import 'package:guidefood/src/vista/pages/listado_recetas.dart';
import 'package:guidefood/src/vista/pages/selector_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => ListadoRecetas(),
    'detalle': (BuildContext context) => DetallePage(),
    'selector': (BuildContext context) => SelectorPage(),
  };
}
