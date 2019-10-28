import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/widgets/SliverPage.dart';
import '../models/ingredient.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiProvider = new RecetasProvider();
  List<Ingrediente> data;
  String title = 'Prueba de titulo';
  @override
  Widget build(BuildContext context) {
    return _getSliver();
  }

  Widget _getSliver() {
    return Container(
      width: getMediaSize(context).width,
      height: getMediaSize(context).height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-sliver-page.png"),
              fit: BoxFit.fill)),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: ,
            pinned: true,
            floating: false,
            expandedHeight: getMediaSize(context).height * 0.23,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      //opacity: top < 100.0 ? 0.0 : 1.0,
                      opacity: 1.0,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                  background: Image.network(
                    "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                    fit: BoxFit.cover,
                  ));
            }),
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
                    return SliverPage(
                      receta: receta,
                    );
                  }, childCount: childCount),
                );
              })
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [_generarSlivers()],
          //   ),
          // )
        ],
      ),
    );
  }

  // Widget _generarSlivers() {
  //   return FutureBuilder(
  //     future: apiProvider.getRecetas(),
  //     builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
  //       if (snapshot.hasData) {
  //         return SliverPage(
  //           receta: snapshot.data,
  //         );
  //       } else {
  //         return Container(
  //             height: 300, child: Center(child: CircularProgressIndicator()));
  //       }
  //     },
  //   );
  // }
}
