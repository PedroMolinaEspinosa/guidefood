import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/colores.dart';

class DrawerGuideFood extends StatefulWidget {
  @override
  _DrawerGuideFoodState createState() => _DrawerGuideFoodState();
}

class _DrawerGuideFoodState extends State<DrawerGuideFood> {
  double scaleSelector = 1;
  double scaleListado = 1;
  double scaleSFavoritos = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                Container(
                  width: size.width,
                  child: Image.asset(
                    "assets/images/drawerheader.gif",
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.width * 0.04),
                    child: Icon(
                      Icons.close,
                      color: black,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform.scale(
                scale: scaleSelector,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(size.width * 0.05),
                    padding: EdgeInsets.only(
                        right: size.height * 0.05,
                        left: size.height * 0.05,
                        bottom: size.height * 0.08,
                        top: size.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/selectortile_drawer_background.jpg"),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.srgbToLinearGamma())),
                    child: Text(
                      'Selector de ingredientes',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: primaryColorDark,
                        decoration: TextDecoration.none,
                        fontSize: size.width * 0.05,
                        fontFamily: "Montserrat-Black",
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      scaleSelector = 0.9;
                    });

                    Navigator.pushReplacementNamed(context, "selector");
                  },
                ),
              ),
              Transform.scale(
                scale: scaleListado,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(size.width * 0.05),
                    padding: EdgeInsets.only(
                        right: size.height * 0.05,
                        left: size.height * 0.05,
                        bottom: size.height * 0.08,
                        top: size.height * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/listatile_drawer_background.jpg"),
                          fit: BoxFit.fill,
                          colorFilter:
                              ColorFilter.mode(black20, BlendMode.colorBurn)),
                    ),
                    child: Center(
                      child: Text(
                        'Lista de recetas',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: white,
                          decoration: TextDecoration.none,
                          fontSize: size.width * 0.05,
                          fontFamily: "Montserrat-Black",
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      scaleListado = 0.9;
                    });
                    Navigator.pushReplacementNamed(context, "listado");
                  },
                ),
              ),
              Transform.scale(
                scale: scaleSFavoritos,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(size.width * 0.05),
                    padding: EdgeInsets.only(
                        right: size.height * 0.05,
                        left: size.height * 0.05,
                        bottom: size.height * 0.05,
                        top: size.height * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/favoritostile_drawer_background.jpg"),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.srgbToLinearGamma())),
                    child: Text(
                      'Favoritos',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: primaryColorDark,
                        decoration: TextDecoration.none,
                        fontSize: size.width * 0.05,
                        fontFamily: "Montserrat-Black",
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      scaleSFavoritos = 0.9;
                    });
                    Navigator.pushNamed(context, "login");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
