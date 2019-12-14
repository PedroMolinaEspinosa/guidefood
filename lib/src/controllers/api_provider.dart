import 'dart:convert';
import 'dart:async';
import 'package:guidefood/src/models/favorito.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/models/valorado.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  bool _cargando = false;
  //String _apiKey = 'fbe9ea629dc8abd2036403c3d5a1e0c2';
  String _urlRecetas = 'http://192.168.0.28:3006/recetas';
  String _urlIngredientes = 'http://192.168.0.28:3006/ingredientes';
  String _urlValorados = 'http://192.168.0.28:3006/valorados';
  String _urlFavoritos = 'http://192.168.0.28:3006/favoritos';

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

  Future<List<Valorado>> getValorados() async {
    var resp;
    try {
      resp = await http.get(Uri.encodeFull(_urlValorados),
          headers: {"Accept": "application/json"});
    } catch (e) {
      print(e);
      return [];
    }

    final decodedData = json.decode(resp.body);

    final valorados = new Valorados.fromJsonList(decodedData);
    return valorados.items;
  }

  enviarValoracion(Valorado valor) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": "${valor.email}", "valoracion": ${valor.valoracion}, "receta": ${valor.receta}, "comentario": "${valor.comentario}"}';

    Response response =
        await http.post(_urlValorados, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode.toString());
  }

  Future<List<Favorito>> getFavoritos() async {
    var resp;
    try {
      resp = await http.get(Uri.encodeFull(_urlFavoritos),
          headers: {"Accept": "application/json"});
    } catch (e) {
      print(e);
      return [];
    }

    final decodedData = json.decode(resp.body);

    final favoritos = new Favoritos.fromJsonList(decodedData);
    return favoritos.items;
  }

  enviarFavorito(Valorado valor) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "${valor.email}", "receta": ${valor.receta}}';

    Response response =
        await http.post(_urlFavoritos, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode.toString());
  }
}
