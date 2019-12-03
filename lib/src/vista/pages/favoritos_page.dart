import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
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
          Container(
            width: size.width,
            height: size.height,
            color: Colors.blue,
          ),
          getAppBar(context, primaryColor.withOpacity(0), size.width * 0.05,
              _scaffoldKey),
        ],
      ),
    );
  }
}
