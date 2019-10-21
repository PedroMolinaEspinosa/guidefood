import 'package:guidefood/src/models/ingredient.dart';

class Receta {
  int id;
  String nombre;
  String descripcion;
  List<Ingrediente> ingredientes;
  double calificacion;
  String imagen;

  Receta({this.id,this.nombre, this.descripcion, this.ingredientes, this.calificacion, this.imagen});


Receta.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    ingredientes = json['ingredientes'];
    calificacion = json['calificacion'];
    imagen = json['imagen'];
  }
}
