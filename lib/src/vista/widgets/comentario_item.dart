import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/models/valorado.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';

class ComentarioItem extends StatelessWidget {
  Valorado valorado;

  ComentarioItem({this.valorado});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: black20,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0.0, 2.0))
      ]),
      constraints: BoxConstraints(maxHeight: size.height * 0.3),
      width: size.width,
      child: Row(
        children: <Widget>[
          _avatar(valorado, size),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    valorado.email,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: black,
                        fontFamily: MontserratFontFamily.medium,
                        fontSize: size.width * 0.04,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.7,
                  child: Text(
                    valorado.comentario,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: black,
                        fontFamily: MontserratFontFamily.medium,
                        fontSize: size.width * 0.04,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    margin: EdgeInsets.only(right: 20),
                    child: getIconCalificacion(valorado.valoracion))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar(Valorado valorado, Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width * 0.1,
      height: size.width * 0.1,
      child: ClipOval(
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsHdrYsaRjun92Fb4XHslw044pZFV8Fe-85rwtYSxYRMTScI-s&s",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
