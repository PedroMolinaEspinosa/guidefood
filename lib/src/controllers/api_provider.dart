import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:http/http.dart' as http;

class RecetasProvider {
  //String _apiKey = 'fbe9ea629dc8abd2036403c3d5a1e0c2';
  String _url = 'http://192.168.0.15:3000/recetas';

  Future<List<Receta>> getRecetas() async {
    var resp;
    try {
      resp = await http
          .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});
    } catch (e) {
      print(e);
      return [];
    }

    final decodedData = json.decode(resp.body);

    final recetas = new Recetas.fromJsonList(decodedData);
    return recetas.items;
  }

  Future<List<Ingrediente>> _procesarRespuestaIngredientes(Uri url) async {
    var resp = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});
    final decodedData = json.decode(resp.body);

    final ingredientes =
        new Ingredientes.fromJsonList(decodedData['ingredientes']);
    return ingredientes.items;
  }
}
