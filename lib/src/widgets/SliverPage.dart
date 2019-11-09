import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/views/clippers/ClipperRecetas.dart';
import 'package:guidefood/src/views/clippers/CustomClipperShadowWidget.dart';

class SliverPage extends StatelessWidget {
  final Receta receta;

  SliverPage({this.receta});
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: receta);
      },
      child: Container(
        height: size.height * 0.14,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: size.width * 0.15,
              height: size.width * 0.15,
              child: Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 0.5,
                        offset: Offset(0.0, 5.0)),
                  ],
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: receta.id,
                  child: FadeInImage(
                    placeholder: AssetImage("assets/images/loading-burger.gif"),
                    image: NetworkImage(receta.imagen),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            _clipperCard(context, receta, size),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white38,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0.5,
                offset: Offset(0.0, 5.0)),
          ],
        ),
      ),
    );
  }

  Widget _clipperCard(BuildContext context, Receta receta, Size size) {
    return ClipShadowPath(
      shadow: Shadow(
          color: Colors.black26, blurRadius: 5, offset: Offset(0.0, 5.0)),
      clipper: CustomClipperComment(),
      child: Container(
        height: size.height * 0.14,
        decoration: BoxDecoration(
          color: blanco90,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: size.width * 0.738,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.03),
                  child: Icon(
                    Icons.lens,
                    color: getIconColorDificultad(receta),
                    size: 15,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.03),
                  child: Text(
                    'Dificultad ${receta.dificultad}',
                    style: textTile,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  receta.nombre,
                  //"brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli brilli",
                  style: titleTile,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: size.width * 0.03),
                    child: Text(
                      'Tiempo: ${receta.duracion}',
                      style: textTile,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      width: 100,
                      height: 20,
                      margin: EdgeInsets.only(left: size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          getIconCalificacion(receta),
                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.02),
                            child: Text(
                              '${receta.calificacion}',
                              style: calificationTile,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
