import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/views/clippers/ClipperRecetas.dart';
import 'package:guidefood/src/views/clippers/CustomClipperShadowWidget.dart';

class SliverPage extends StatelessWidget {
  Receta receta;

  SliverPage({this.receta});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getMediaSize(context).height * 0.14,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: getMediaSize(context).width * 0.15,
              height: getMediaSize(context).width * 0.15,
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
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(receta.imagen)))),
          _clipperCard(context, receta),
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
    );
  }

  Widget _clipperCard(BuildContext context, Receta receta) {
    EdgeInsets padingCommentFirstRow =
        EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5);
    return ClipShadowPath(
      shadow: Shadow(
          color: Colors.black26, blurRadius: 5, offset: Offset(0.0, 5.0)),
      clipper: CustomClipperComment(),
      child: Container(
        height: getMediaSize(context).height * 0.14,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: getMediaSize(context).width * 0.738,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: getMediaSize(context).width * 0.03),
                  child: Icon(
                    Icons.lens,
                    color: getIconColorDificultad(receta),
                    size: 15,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: getMediaSize(context).width * 0.03),
                  child: Text(
                    'Dificultad ${receta.dificultad}',
                    style: textTile,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getMediaSize(context).width * 0.01,
            ),
            Flexible(
              child: Container(
                margin:
                    EdgeInsets.only(left: getMediaSize(context).width * 0.03),
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
              height: getMediaSize(context).width * 0.01,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                        left: getMediaSize(context).width * 0.03),
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
                      margin: EdgeInsets.only(
                          left: getMediaSize(context).width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          getIconCalificacion(receta),
                          Container(
                            margin: EdgeInsets.only(
                                left: getMediaSize(context).width * 0.02),
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

  Color getIconColorDificultad(Receta receta) {
    switch (receta.dificultad) {
      case "Baja":
        return Colors.green;
        break;
      case "Media":
        return Colors.orangeAccent;
        break;
      case "Alta":
        return Colors.red;
        break;
    }
  }

  Image getIconCalificacion(Receta receta) {
    double calificacion = 7;
    if (receta.calificacion < 2.5)
      return Image(
        image: AssetImage("assets/iconos/heart0.png"),
      );
    if (receta.calificacion > 2.5 && receta.calificacion < 5.0)
      return Image(
        image: AssetImage("assets/iconos/heart25.png"),
      );
    if (receta.calificacion > 5.0 && receta.calificacion < 7.5)
      return Image(
        image: AssetImage("assets/iconos/heart50.png"),
      );
    if (receta.calificacion > 7.5 && receta.calificacion < 9.5)
      return Image(
        image: AssetImage("assets/iconos/heart75.png"),
      );
    if (receta.calificacion > 9.5)
      return Image(
        image: AssetImage("assets/iconos/heart100.png"),
      );
  }
}
