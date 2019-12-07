import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/styles/estilo.dart';

Widget getAppBar(BuildContext context, Color color, double margin,
    GlobalKey<ScaffoldState> _scaffoldKey) {
  return PreferredSize(
    preferredSize:
        Size(getMediaSize(context).width, getMediaSize(context).height * 0.1),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: margin),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white54,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 2.0)),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white54,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 2.0)),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.dehaze),
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
