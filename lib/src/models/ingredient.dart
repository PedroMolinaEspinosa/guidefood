import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Ingredientes {
  List<Ingrediente> items = new List();

  Ingredientes();

  Ingredientes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final ingrediente = new Ingrediente.fromJsonMap(item);
      items.add(ingrediente);
    }
  }
}

class Ingrediente extends Equatable {
  int id;
  String nombre;
  String tipo;
  String imagen;
  String medida;
  int cantidad;

  Ingrediente(
      {@required this.id,
      @required this.nombre,
      @required this.tipo,
      @required this.imagen,
      @required this.medida,
      this.cantidad})
      : super();

  Ingrediente.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    imagen = json['imagen'];
    cantidad = json['cantidad'];
    medida = json['medida'];
  }
}
