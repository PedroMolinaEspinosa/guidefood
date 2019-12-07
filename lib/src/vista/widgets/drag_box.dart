import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/vista/widgets/contenedor_ingrediente_widget.dart';

class DragBox extends StatefulWidget {
  final Ingrediente ingrediente;
  final Size size;

  DragBox(this.ingrediente, this.size);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable(
        data: widget.ingrediente,
        child: ContenedorIngredienteWidget(
            seleccionOElegido: true,
            size: widget.size,
            ingrediente: widget.ingrediente),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Opacity(
          opacity: 0.7,
          child: Container(
            child: Image.network(widget.ingrediente.imagen),
            width: widget.size.width * 0.2,
            height: widget.size.width * 0.2,
          ),
        ),
      ),
    );
  }
}
