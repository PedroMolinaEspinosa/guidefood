import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/widgets/appBar_%20page.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    final size = getMediaSize(context);
    final Receta receta = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(context, primaryColorLight, 17),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration:
                    BoxDecoration(color: primaryColorLight), //modificado
                height: size.height / 4,
                width: size.width,
              ),
              clipper: BottomWaveProfileClipper(),
            ),
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: size.width * 0.1),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.lens,
                            color: getIconColorDificultad(receta),
                            size: 28,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              receta.dificultad,
                              style: medianoTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: size.width * 0.1),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 30, child: getIconCalificacion(receta)),
                          Container(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              receta.calificacion.toString(),
                              style: medianoTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                width: size.width,
                height: size.height * 0.07,
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                width: size.width,
                child: Center(
                  child: Text(
                    receta.nombre,
                    style: nombreDetalle,
                  ),
                ),
                height: size.height * 0.09,
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                color: marron,
                width: size.width,
                height: size.height * 0.07,
              ),
              Container(
                height: size.height * 0.5,
                width: size.height,
                margin: EdgeInsets.only(
                    top: size.height * 0.02,
                    right: size.width * 0.05,
                    left: size.width * 0.05,
                    bottom: size.width * 0.05),
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 0.5,
                        offset: Offset(0.0, 2.0)),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                        //'${currentUser.firstName} ${currentUser.lastName}  '
                        'NAME',
                        style: titleTile,
                        textAlign: TextAlign.center),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          SizedBox(width: 30),
                          Text(
                              //'${currentUser.email}'
                              'email@example.com',
                              style: medianoTextStyle),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                        //'${currentUser.aboutMe}'
                        'About me',
                        style: paragraphTextStyle,
                        textAlign: TextAlign.justify),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3),
              ),
              SizedBox(height: 10)
            ]),
            _buildAvatar(receta, context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(Receta receta, context) {
    Size size = MediaQuery.of(context).size;
    var _avatar = NetworkImage(receta.imagen);
    //NetworkImage(image);
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
          top: size.height * 0.01,
          left: size.width * 0.5 - (size.width * (0.48 * 0.5))),
      width: size.width * 0.48,
      height: size.width * 0.48,
      decoration: BoxDecoration(
          color: white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0.5,
                offset: Offset(0.0, 2.0)),
          ]),
      child: Hero(
        transitionOnUserGestures: true,
        tag: receta.id,
        child: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(fit: BoxFit.fitHeight, image: _avatar),
          ),
        ),
      ),
    );
  }
}

class BottomWaveProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.18, size.height * 0.45,
        size.width * 0.36, size.height * 0.63);
    path.quadraticBezierTo(0.54 * size.width, size.height * 0.85,
        size.width * 0.75, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.83, size.height * 0.53,
        size.width * 0.89, size.height * 0.64);
    path.quadraticBezierTo(
        size.width * 0.999, size.height * 0.83, size.width, size.height * 0.72);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
