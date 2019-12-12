import 'package:meta/meta.dart';

class Usuario {
  Usuario({
    @required this.id,
    this.email,
    this.imagenUrl,
    this.nombre,
  });

  String id;
  String email;
  String imagenUrl;
  String nombre;
}
