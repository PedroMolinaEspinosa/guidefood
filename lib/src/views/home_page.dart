import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/styles/colors.dart';
import 'package:guidefood/src/widgets/SliverPage.dart';
import 'package:http/http.dart' as http;

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
      height: getMediaSize(context).height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-sliver-page.png"),
              fit: BoxFit.fitHeight)),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [_generarSlivers()],
            ),
          )
        ],
      ),
    );
  }

  Widget _generarSlivers() {
    return FutureBuilder(
      future: apiProvider.getRecetas(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return SliverPage(
            recetas: snapshot.data,
          );
        } else {
          return Container(
              height: 300, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
