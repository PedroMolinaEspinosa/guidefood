import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/clippers/ClipperFavoritosTop.dart';
import 'package:guidefood/src/vista/widgets/drawer.dart';

class FavoritosPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerGuideFood(),
      body: Stack(
        children: <Widget>[
          _vistaFavoritos(size),
          getAppBar(context, transparente, size.width * 0.05, _scaffoldKey),
        ],
      ),
    );
  }

  Widget _vistaFavoritos(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[_clipperSuperior(size)],
      ),
    );
  }

  Widget _clipperSuperior(Size size) {
    return ClipPath(
      child: Container(
        width: size.width,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF7C00EA), Color(0xFFEA0027)],
          ),
        ),
      ),
      clipper: ClipperFavoritosTop(),
    );
  }
}
