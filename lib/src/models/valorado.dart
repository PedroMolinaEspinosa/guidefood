import 'package:flutter/material.dart';

class Valorados {
  List<Valorado> items = new List();

  Valorados();

  Valorados.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final valorado = new Valorado.fromJsonMap(item);
      items.add(valorado);
    }
  }
}

class Valorado {
  String email;
  int receta;
  int valoracion;
  String comentario;
  String fecha;

  Valorado(
      {@required this.email,
      @required this.receta,
      @required this.valoracion,
      @required this.comentario,
      this.fecha});

  Valorado.fromJsonMap(Map<String, dynamic> json) {
    email = json['email'];
    receta = json['receta'];
    comentario = json['comentario'];
    valoracion = json['valoracion'];
    fecha = json['fecha'];
  }
}
