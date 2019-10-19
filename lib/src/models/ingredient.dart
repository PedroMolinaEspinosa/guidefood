import 'package:flutter/material.dart';

class Ingrediente {
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
      this.cantidad});

  Ingrediente.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    imagen = json['imagen'];
    cantidad = json['cantidad'];
    medida = json['medida'];
  }
}
