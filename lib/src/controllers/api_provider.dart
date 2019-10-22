import 'dart:convert';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:http/http.dart' as http;

class RecetasProvider {
  //String _apiKey = 'fbe9ea629dc8abd2036403c3d5a1e0c2';
  String _url = 'http://localhost:3000/ingredientes';

  Future<List<Receta>> _procesarRespuestaRecetas(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final recetas = new Recetas.fromJsonList(decodedData['results']);
    return recetas.items;
  }

  Future<List<Ingrediente>> _procesarRespuestaIngredientes(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final ingredientes = new Ingredientes.fromJsonList(decodedData['results']);
    return ingredientes.items;
  }

  Future<List<Receta>> getRecetas() async {
    final url = Uri.https(
      _url,
      'recetas',
    );

    return await _procesarRespuestaRecetas(url);
  }

  Future<List<Ingrediente>> getIngredientes() async {
    final url = Uri.https(_url, 'ingredientes');

    return await _procesarRespuestaIngredientes(url);
  }
}
