import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/widgets/SliverPage.dart';
import 'package:guidefood/src/widgets/appBar_%20page.dart';
import '../models/ingredient.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var top = 0.0;
  String imagenError = "assets/images/background-sliver-page.png";

  bool datosCargados = false;
  final apiProvider = new RecetasProvider();

  @override
  Widget build(BuildContext context) {
    return _getSliver();
  }

  Widget _getSliver() {
    return Container(
      width: getMediaSize(context).width,
      height: getMediaSize(context).height,
      decoration: BoxDecoration(
        color: white,
        image: DecorationImage(
            image: AssetImage("assets/images/background-sliver-page.png"),
            fit: BoxFit.fill),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: getAppBar(context, Colors.transparent, 0),
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
                  "assets/images/recetasSliver.jpg",
                  fit: BoxFit.fill,
                ),
              );
            }),
            backgroundColor: marron,
            elevation: 0.0,
            pinned: true,
            floating: false,
            expandedHeight: getMediaSize(context).height * 0.23,
          ),
          FutureBuilder(
            future: apiProvider.getRecetas(),
            builder: (context, projectSnap) {
              //                Whether project = projectSnap.data[index]; //todo check your model
              print('entra ');
              var childCount = 0;
              if (projectSnap.connectionState != ConnectionState.done ||
                  projectSnap.hasData == null)
                childCount = 0;
              else
                childCount = projectSnap.data.length;

              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  print('entra list');
                  if (projectSnap.connectionState != ConnectionState.done) {
                    print('entra en que no tiene datos');
                    //todo handle state
                    return Center(
                        child:
                            CircularProgressIndicator()); //todo set progress bar
                  }
                  if (projectSnap.hasData == null) {
                    print('entra en que no tiene datos');
                    return Center(
                      child: Container(
                        color: Colors.red,
                        width: 50,
                        height: 60,
                      ),
                    );
                  }
                  print('entra en que tiene datos');
                  Receta receta = projectSnap.data[index];
                  Receta ultimaReceta =
                      projectSnap.data[projectSnap.data.length - 1];

                  return SliverPage(
                    receta: receta,
                  );
                }, childCount: childCount),
              );
            },
          ),
        ],
      ),
    );
  }
}
