import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/styles/estilo.dart';

class ContenedorIngredienteWidget extends StatelessWidget {
  final Size size;
  final Ingrediente ingrediente;

  ContenedorIngredienteWidget(
      {@required this.size, @required this.ingrediente});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsets.all(5),
        width: size.width * 0.2,
        height: size.width * 0.2,
        child: Column(
          children: <Widget>[
            Container(
              width: size.width * 0.1,
              height: size.width * 0.1,
              child: FadeInImage(
                image: NetworkImage(ingrediente.imagen),
                placeholder: AssetImage("assets/images/loading.gif"),
              ),
            ),
            Container(
              child: Text(
                ingrediente.nombre,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: size.width * 0.025),
              ),
            ),
            Container(
              child: Text(
                ingrediente.tipo,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(fontSize: size.width * 0.022),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
