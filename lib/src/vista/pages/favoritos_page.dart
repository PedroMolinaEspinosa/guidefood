import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/models/favorito.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/models/usuario.dart';
import 'package:guidefood/src/models/valorado.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/clippers/ClippersFavoritos.dart';
import 'package:guidefood/src/vista/widgets/drawer.dart';
import 'package:guidefood/src/vista/widgets/sliver_item.dart';

class FavoritosPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String imagenError = "assets/images/no-conection.png";
  ApiProvider api = new ApiProvider();
  List<Receta> recetas;
  List<Valorado> valoradas;
  List<Favorito> favoritos;
  Usuario usuario;
  @override
  Widget build(BuildContext context) {
    valoradas = new List<Valorado>();
    recetas = new List<Receta>();
    Size size = MediaQuery.of(context).size;
    final FirebaseUser firebaseUser = ModalRoute.of(context).settings.arguments;
    usuario = new Usuario(
        id: firebaseUser.uid,
        email: firebaseUser.email,
        imagenUrl: firebaseUser.photoUrl,
        nombre: firebaseUser.displayName);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerGuideFood(),
      body: Container(
        width: size.width,
        height: size.height,
        child: DefaultTabController(
          length: 2,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.15),
                width: size.width,
                child: Column(
                  children: <Widget>[
                    _panelUsuario(size, usuario),
                    Container(
                      height: size.height * 0.71,
                      child: TabBarView(
                        children: [
                          _vistaValorados(context, size),
                          _vistaFavoritos(context, size),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _clipperSuperior(size),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.1),
                child: _tabBar(size),
              ),
              _favoritosLista(),
              Positioned(bottom: 0, child: _clipperInferior(size)),
              getAppBar(context, transparente, size.width * 0.05, _scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _clipperSuperior(Size size) {
    return ClipPath(
      child: Container(
        width: size.width,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF7C00EA), Color(0xFFEA0027)],
          ),
        ),
      ),
      clipper: ClipperFavoritosTop(),
    );
  }

  Widget _clipperInferior(Size size) {
    return ClipPath(
      child: Container(
        width: size.width,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF7C00EA), Color(0xFFEA0027)],
          ),
        ),
      ),
      clipper: ClipperFavoritosBottom(),
    );
  }

  Widget _favoritosLista() {
    return Container();
  }

  Widget _tabBar(Size size) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: black20,
      tabs: [
        Container(
          width: size.width * 0.1,
          height: size.width * 0.1,
          decoration: BoxDecoration(
              color: Color(0xFFEA0027).withOpacity(0.3),
              shape: BoxShape.circle),
          child: Tab(
            child: Container(
              child: Icon(
                Icons.favorite,
                color: Color(0xFFEA0027),
                size: size.width * 0.06,
              ),
            ),
          ),
        ),
        Tab(
          child: Container(
            width: size.width * 0.1,
            height: size.width * 0.1,
            decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.5), shape: BoxShape.circle),
            child: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }

  Widget _panelUsuario(Size size, Usuario usuario) {
    return Container(
      width: size.width,
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Container(
              width: size.width * 0.17,
              height: size.height * 0.08,
              child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 300),
                fit: BoxFit.fill,
                image: NetworkImage(usuario.imagenUrl),
                placeholder: AssetImage("assets/images/transparent.png"),
              ),
              decoration: BoxDecoration(boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 2,
                  color: black20,
                  offset: Offset(0.0, 2.0),
                )
              ], shape: BoxShape.circle),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.03,
            child: Text(
              usuario.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: MontserratFontFamily.medium,
                  fontSize: size.width * 0.04),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.025,
            child: Text(
              'Hola, ${usuario.nombre}!',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: MontserratFontFamily.bold,
                  fontSize: size.width * 0.04),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.005,
            color: primaryColor,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: black20,
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: Offset(0.0, 5.0))
        ],
      ),
    );
  }

  Widget _vistaValorados(BuildContext context, Size size) {
    return Container(
      child: FutureBuilder(
        future: api.getValorados(),
        builder: (context, snapshot) {
          var childCount = 0;

          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == null) {
            childCount = 0;
            return Center(
                  child: Container(
                width: size.width,
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  image: AssetImage(
                    imagenError,
                  ),
                  placeholder: AssetImage("assets/images/transparent.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          } else {
            valoradas = snapshot.data;
            return FutureBuilder(
              future: api.getRecetas(),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done ||
                    snap.hasData == null) {
                  childCount = 0;
                  return Container();
                } else {
                  recetas = snap.data;
                  List<RecetaValorada> recetasValoradas =
                      new List<RecetaValorada>();
                  recetasValoradas = getRecetasValoradas(valoradas, recetas);
                  childCount = recetasValoradas.length;
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: size.height * 0.01,
                                bottom: size.height * 0.01),
                            child: Text(
                              "Recetas valoradas",
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontFamily: "Golden-Hills",
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: size.height * 0.15),
                        sliver: SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              child: _recetaValoracion(
                                  size, recetasValoradas[index]),
                            );
                          }, childCount: childCount),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget _recetaValoracion(Size size, RecetaValorada recetaValorada) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: black20,
          child: Column(
            children: <Widget>[
              SliverItem(
                receta: recetaValorada.receta,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Valoracion",
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontFamily: "Golden-Hills",
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width * 0.07),
                          child: _iconoCalificacion(
                              size, recetaValorada.valorado.valoracion),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width * 0.03),
                          child: Text(
                            recetaValorada.valorado.valoracion.toString(),
                            style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontFamily: MontserratFontFamily.medium,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: size.height * 0.03),
                      child: Text(
                        recetaValorada.valorado.comentario,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontFamily: MontserratFontFamily.medium,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _recetaFavorita(Size size, RecetaFavorita recetaValorada) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: SliverItem(
        receta: recetaValorada.receta,
      ),
    );
  }

  Widget _iconoCalificacion(Size size, double calificacion) {
    return Container(
      child: Container(
          height: size.width * 0.06, child: getIconCalificacion(calificacion)),
    );
  }

  List<RecetaValorada> getRecetasValoradas(
      List<Valorado> valoradas, List<Receta> recetas) {
    List<RecetaValorada> recetasValoradas = new List<RecetaValorada>();

    for (var i = 0; i < valoradas.length; i++) {
      for (var j = 0; j < recetas.length; j++) {
        if (valoradas[i].email == usuario.email &&
            valoradas[i].receta == recetas[j].id) {
          RecetaValorada recetaValorada =
              new RecetaValorada(receta: recetas[j], valorado: valoradas[i]);
          recetasValoradas.add(recetaValorada);
        }
      }
    }
    recetasValoradas.add(
      RecetaValorada(
        receta: recetas[9],
        valorado: Valorado(
          comentario:
              "Es que me parece increíble que pongan los animales así vivos y luego la receta, osea, esto va en contra de los derechos de los animales, voy a denunciaros por opresores.",
          email: "pedromolesp@gmail.com",
          receta: 9,
          valoracion: 1,
        ),
      ),
    );
    recetasValoradas.add(
      RecetaValorada(
        receta: recetas[0],
        valorado: Valorado(
          comentario: "Menuda receta, me encanta, es genial",
          email: "pedromolesp@gmail.com",
          receta: 0,
          valoracion: 2,
        ),
      ),
    );

    recetasValoradas.add(
      RecetaValorada(
        receta: recetas[3],
        valorado: Valorado(
          comentario: "Esto no es comestible, llevo un mes en urgencias",
          email: "pedromolesp@gmail.com",
          receta: 3,
          valoracion: 9,
        ),
      ),
    );

    return recetasValoradas;
  }

  List<RecetaFavorita> getRecetasFavoritos(
      List<Favorito> favoritos, List<Receta> recetas) {
    List<RecetaFavorita> recetasFavoritas = new List<RecetaFavorita>();

    for (var i = 0; i < favoritos.length; i++) {
      for (var j = 0; j < recetas.length; j++) {
        if (favoritos[i].email == usuario.email &&
            favoritos[i].receta == recetas[j].id) {
          RecetaFavorita recetaFavorita =
              new RecetaFavorita(receta: recetas[j], favorito: favoritos[i]);
          recetasFavoritas.add(recetaFavorita);
        }
      }
    }
    recetasFavoritas.add(
      RecetaFavorita(
        receta: recetas[2],
        favorito: Favorito(email: "pedromolesp@gmail.com", receta: 2),
      ),
    );

    recetasFavoritas.add(
      RecetaFavorita(
        receta: recetas[7],
        favorito: Favorito(email: "pedromolesp@gmail.com", receta: 7),
      ),
    );
    recetasFavoritas.add(
      RecetaFavorita(
        receta: recetas[8],
        favorito: Favorito(email: "pedromolesp@gmail.com", receta: 8),
      ),
    );
    recetasFavoritas.add(
      RecetaFavorita(
        receta: recetas[9],
        favorito: Favorito(email: "pedromolesp@gmail.com", receta: 9),
      ),
    );

    return recetasFavoritas;
  }

  Widget _vistaFavoritos(BuildContext context, Size size) {
    return Container(
      child: FutureBuilder(
        future: api.getFavoritos(),
        builder: (context, snapshot) {
          var childCount = 0;

          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == null) {
            childCount = 0;
            return CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Center(
                          child: Container(
                        width: size.width,
                        child: FadeInImage(
                          fadeInDuration: Duration(milliseconds: 200),
                          image: AssetImage(
                            imagenError,
                          ),
                          placeholder:
                              AssetImage("assets/images/transparent.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ));
                    },
                    childCount: 1,
                  ),
                ),
              ],
            );
          } else {
            favoritos = snapshot.data;
            return FutureBuilder(
              future: api.getRecetas(),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done ||
                    snap.hasData == null) {
                  childCount = 0;
                  return Container();
                } else {
                  recetas = snap.data;
                  List<RecetaFavorita> recetasFavoritas =
                      new List<RecetaFavorita>();
                  recetasFavoritas = getRecetasFavoritos(favoritos, recetas);
                  childCount = recetasFavoritas.length;
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: size.height * 0.01,
                                bottom: size.height * 0.01),
                            child: Text(
                              "Recetas favoritas",
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontFamily: "Golden-Hills",
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: size.height * 0.15),
                        sliver: SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              child: _recetaFavorita(
                                  size, recetasFavoritas[index]),
                            );
                          }, childCount: childCount),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

class RecetaValorada {
  Receta receta;
  Valorado valorado;
  RecetaValorada({this.receta, this.valorado});
}

class RecetaFavorita {
  Receta receta;
  Favorito favorito;
  RecetaFavorita({this.receta, this.favorito});
}
