import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/views/clippers/ClipperRecetas.dart';
import 'package:guidefood/src/views/clippers/CustomClipperShadowWidget.dart';

class SliverPage extends StatelessWidget {
  List<Receta> recetas;

  SliverPage({this.recetas});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          return Container(
            height: getMediaSize(context).height * 0.12,
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
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(recetas[index].imagen)))),
                _clipperCard(context, index),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 5.0)),
              ],
            ),
          );
        });
  }

  Widget _clipperCard(BuildContext context, int index) {
    EdgeInsets padingCommentFirstRow =
        EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5);
    return ClipShadowPath(
      shadow: Shadow(
          color: Colors.black26, blurRadius: 5, offset: Offset(0.0, 5.0)),
      clipper: CustomClipperComment(),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: getMediaSize(context).width * 0.75,
          child: Column(
            children: <Widget>[
              Text(
                recetas[index].nombre,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.orangeAccent,
                  fontSize: 18,
                ),
              ),
            ],
          )),
    );
  }
}
