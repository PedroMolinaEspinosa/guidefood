import 'package:flutter/material.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';

class DrawerGuideFood extends StatelessWidget {
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
                      color: white,
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
              GestureDetector(
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
                  Navigator.pushReplacementNamed(context, "selector");
                },
              ),
              GestureDetector(
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
                  Navigator.pushReplacementNamed(context, "listado");
                },
              ),
              GestureDetector(
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
                  Navigator.pushReplacementNamed(context, "login");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
