import 'package:guidefood/src/models/ingredient.dart';

import 'dart:convert';

class Recetas {
  List<Receta> items = new List();

  Recetas();

  Recetas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final receta = new Receta.fromJsonMap(item);
      items.add(receta);
    }
  }
}

class Receta {
  int id;
  String nombre;
  String descripcion;
  List<Ingrediente> ingredientes;
  double calificacion;
  String imagen;

  Receta(
      {this.id,
      this.nombre,
      this.descripcion,
      this.ingredientes,
      this.calificacion,
      this.imagen});

  Receta.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    ingredientes = json['ingredientes'];
    calificacion = json['calificacion'];
    imagen = json['imagen'];
  }
}
