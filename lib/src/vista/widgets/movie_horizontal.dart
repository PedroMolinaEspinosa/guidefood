import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Ingrediente> ingredientes;

  MovieHorizontal({@required this.ingredientes});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.2);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: ingredientes.length,
        itemBuilder: (context, i) => _tarjeta(context, ingredientes[i]),
        //children: _tarjetas(context),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Ingrediente ingrediente) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              image: NetworkImage(ingrediente.imagen),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            ingrediente.nombre,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: ingrediente);
      },
      child: tarjeta,
    );
  }

  // List<Widget> _tarjetas(BuildContext context) {
  //   return ingredientes.map((ingrediente) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: <Widget>[
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: FadeInImage(
  //               image: NetworkImage(ingrediente.imagen),
  //               placeholder: AssetImage('assets/img/no-image.jpg'),
  //               fit: BoxFit.cover,
  //               height: 100,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             ingrediente.nombre,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,
  //           )
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
