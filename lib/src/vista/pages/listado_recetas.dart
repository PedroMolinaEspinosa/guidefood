import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/SliverItem.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/drawer.dart';

class ListadoRecetasPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var top = 0.0;
  String imagenTopic = "assets/images/recetasSliver.jpg";
  String imagenError = "assets/images/no-conection.png";

  bool datosCargados = false;
  final apiProvider = new RecetasProvider();

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return _getSliver(size, context);
  }

  Widget _getSliver(Size size, BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerGuideFood(),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: white,
          image: DecorationImage(
              image: AssetImage("assets/images/background-sliver-page.png"),
              fit: BoxFit.fill),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[
                new Container(),
              ],
              automaticallyImplyLeading: false,
              title: getAppBar(
                context,
                transparente,
                0,
                _scaffoldKey,
              ),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(vertical: 0),
                  title: Container(
                    color: black,
                    height: 1,
                  ),
                  background: Image.asset(
                    imagenTopic,
                    fit: BoxFit.fill,
                  ),
                );
              }),
              backgroundColor: marron,
              elevation: 0.0,
              pinned: true,
              floating: false,
              expandedHeight: size.height * 0.23,
            ),
            FutureBuilder(
              future: apiProvider.getRecetas(),
              builder: (BuildContext context, AsyncSnapshot<List> projectSnap) {
                var childCount = 0;
                if (projectSnap.connectionState != ConnectionState.done ||
                    projectSnap.hasData == null) {
                  childCount = 0;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Center(
                            child: Container(
                          width: size.width,
                          height: size.height * 0.5,
                          child: Image.asset(
                            imagenError,
                            fit: BoxFit.fitWidth,
                          ),
                        ));
                      },
                      childCount: 1,
                    ),
                  );
                } else
                  childCount = projectSnap.data.length;

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Receta receta = projectSnap.data[index];
                      return SliverItem(
                        receta: receta,
                      );
                    },
                    childCount: childCount,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
