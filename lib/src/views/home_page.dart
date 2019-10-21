import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/styles/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Prueba de titulo';
  @override
  Widget build(BuildContext context) {
    return _getSliver();
  }

  Widget _getSliver() {
    return Container(
      color: Colors.orange,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: ,
            pinned: true,
            floating: false,
            expandedHeight: getMediaSize(context).height * 0.3,
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
              [
                generateSliver(),
                generateSliver(),
                generateSliver(),
                generateSliver(),
                generateSliver(),
                generateSliver(),
                generateSliver(),
                generateSliver(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget generateSliver() {
    return Container(
      height: getMediaSize(context).height * 0.12,
      color: backgroundsNeurok,
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
                      image: NetworkImage("https://i.imgur.com/BoN9kdC.png")))),
        ],
      ),
    );
  }
}
