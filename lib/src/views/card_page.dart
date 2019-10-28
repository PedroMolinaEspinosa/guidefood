import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Estes es el título de la tarjeta'),
            subtitle: Text(
                'Este es un texto muy largo de prueba que tengo que escribir para hacer esta prueba'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              image: NetworkImage(
                  'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300,
              fit: BoxFit.cover),
          //   image: NetworkImage(
          //       'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text('No tengo idea de que poner')),
        ],
      ),
    );

    return Container(
      child: ClipRRect(borderRadius: BorderRadius.circular(30), child: card),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
    );
  }
}
