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
  List<dynamic> descripcion;
  List<List<dynamic>> ingredientes = new List<List<dynamic>>();
  String dificultad;
  String duracion;
  String categoria;
  double calificacion;
  String imagen;

  Receta(
      {this.id,
      this.nombre,
      this.descripcion,
      this.ingredientes,
      this.dificultad,
      this.duracion,
      this.categoria,
      this.calificacion,
      this.imagen});

  Receta.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    ingredientes = json['ingredientes'].cast<List<dynamic>>();
    dificultad = json['dificultad'];
    duracion = json['duracion'];
    categoria = json['categoria'];
    calificacion = json['calificacion'] / 1;
    imagen = json['imagen'];
  }
}
