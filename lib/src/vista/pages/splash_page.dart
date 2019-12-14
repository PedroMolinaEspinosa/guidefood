import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/colores.dart';

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
        child: Stack(
          children: <Widget>[
            Positioned(
              top: size.height * 0,
              bottom: size.height * 0.5,
              left: size.width * 0.1,
              right: size.width * 0.08,
              child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  width: size.width * 0.7,
                  child: FadeInImage(
                    fadeInDuration: Duration(milliseconds: 300),
                    image: AssetImage("assets/images/bear.gif"),
                    placeholder: AssetImage("assets/images/transparent.png"),
                  )),
            ),
            Center(
              child: Container(
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
