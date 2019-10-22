import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/ingredient.dart';

class SliverPage extends StatelessWidget {
  List<Ingrediente> ingredientes;

  SliverPage({this.ingredientes});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ingredientes.length,
        itemBuilder: (context, index) {
          return Container(
            height: getMediaSize(context).height * 0.12,
            color: Colors.orangeAccent,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: getMediaSize(context).width * 0.12,
                    height: getMediaSize(context).width * 0.12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(ingredientes[index].imagen)))),
              ],
            ),
          );
        });
  }
}
