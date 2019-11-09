import 'package:flutter/material.dart';
import 'package:guidefood/src/models/receta.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    final Receta receta = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Text(receta.nombre),
    );
  }
}
