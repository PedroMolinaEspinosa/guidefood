import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/estilo.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  _SplashPageState() {
    _timer = new Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        Navigator.pushReplacementNamed(context, "listado");
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              width: size.width * 0.7,
              child: Image.asset("assets/images/bear.gif"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Guidefood",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: white,
                    fontSize: size.width * 0.17,
                    fontFamily: "Golden-Hills"),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF94CF48), Color(0xFF006AB3)],
        ),
      ),
    );
  }
}
