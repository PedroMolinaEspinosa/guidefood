import 'package:flutter/material.dart';

class Favoritos {
  List<Favorito> items = new List();

  Favoritos();

  Favoritos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final favorito = new Favorito.fromJsonMap(item);
      items.add(favorito);
    }
  }
}

class Favorito {
  String email;
  int receta;

  Favorito({
    @required this.email,
    @required this.receta,
  });

  Favorito.fromJsonMap(Map<String, dynamic> json) {
    email = json['email'];
    receta = json['receta'];
  }
}
