import 'dart:convert';
import 'dart:async';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:http/http.dart' as http;

class RecetasProvider {
  bool _cargando = false;
  //String _apiKey = 'fbe9ea629dc8abd2036403c3d5a1e0c2';
  String _urlRecetas = 'http://192.168.0.22:3000/recetas';
  String _urlIngredientes = 'http://192.168.0.22:3000/ingredientes';

  Future<List<Receta>> getRecetas() async {
    var resp;
    if (_cargando)
      return [];
    else
      _cargando = true;

    try {
      resp = await http.get(Uri.encodeFull(_urlRecetas),
          headers: {"Accept": "application/json"});
    } catch (e) {
      print(e);
      return [];
    }

    final decodedData = json.decode(resp.body);

    final recetas = new Recetas.fromJsonList(decodedData);
    _cargando = false;
    return recetas.items;
  }

  //
  Future<List<Ingrediente>> getIngredientes() async {
    var resp;
    try {
      resp = await http.get(Uri.encodeFull(_urlIngredientes),
          headers: {"Accept": "application/json"});
    } catch (e) {
      print(e);
      return [];
    }

    final decodedData = json.decode(resp.body);

    final ingredientes = new Ingredientes.fromJsonList(decodedData);
    return ingredientes.items;
  }
}
