import 'package:flutter/material.dart';
import 'package:guidefood/src/views/detalle_page.dart';
import 'package:guidefood/src/views/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'detalle': (BuildContext context) => DetallePage(),
  };
}
