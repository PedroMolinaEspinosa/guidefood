import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/styles/estilo.dart';

class ContenedorIngredienteWidget extends StatelessWidget {
  final Size size;
  final Ingrediente ingrediente;
  final Color color;
  final double tamanno;
  final bool seleccionOElegido;

  ContenedorIngredienteWidget(
      {@required this.size,
      @required this.ingrediente,
      @required this.seleccionOElegido,
      this.color,
      this.tamanno});

  @override
  Widget build(BuildContext context) {
    if (seleccionOElegido)
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.all(5),
          width: tamanno,
          height: tamanno,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width * 0.1,
                height: size.width * 0.08,
                child: FadeInImage(
                  image: NetworkImage(ingrediente.imagen),
                  placeholder: AssetImage("assets/images/loading.gif"),
                ),
              ),
              Container(
                child: Text(
                  "${ingrediente.nombre} ${ingrediente.tipo}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: size.width * 0.025),
                ),
              ),
              // Container(
              //   child: Text(
              //     ingrediente.tipo,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.center,
              //     maxLines: 1,
              //     style: TextStyle(fontSize: size.width * 0.022),
              //   ),
              // )
            ],
          ),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(
                color: color != null ? color : white,
                width: 2,
                style: BorderStyle.solid),
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
    else
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.all(5),
          width: size.width * 0.2,
          height: size.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width * 0.15,
                height: size.width * 0.12,
                child: FadeInImage(
                  image: NetworkImage(ingrediente.imagen),
                  placeholder: AssetImage("assets/images/loading.gif"),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.03,
                child: Text(
                  ingrediente.nombre,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: size.width * 0.025),
                ),
              ),
              Container(
                width: size.width * 0.2,
                height: size.width * 0.03,
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
            border: Border.all(
                color: color != null ? color : white,
                width: 2,
                style: BorderStyle.solid),
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
