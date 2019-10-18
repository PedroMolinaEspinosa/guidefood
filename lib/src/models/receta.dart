import 'package:guidefood/src/models/ingredient.dart';

class Receta {
  String nombre;
  String descripcion;
  List<Ingrediente> ingredientes;
  double calificacion;

  Receta({this.nombre, this.descripcion, this.ingredientes, this.calificacion});
}
