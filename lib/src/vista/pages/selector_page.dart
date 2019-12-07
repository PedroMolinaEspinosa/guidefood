import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/contenedor_ingrediente_widget.dart';
import 'package:guidefood/src/vista/widgets/custom_dialog_ingrediente.dart';
import 'package:guidefood/src/vista/widgets/drawer.dart';
import 'package:guidefood/src/vista/widgets/grid_seleccion.dart';

class SelectorPage extends StatefulWidget {
  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ApiProvider provider = new ApiProvider();
  List<Ingrediente> listaPasada = new List<Ingrediente>();

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerGuideFood(),
      body: Stack(
        children: <Widget>[
          _body(size),
          getAppBar(
            context,
            primaryColor.withOpacity(0),
            size.width * 0.05,
            _scaffoldKey,
          ),
        ],
      ),
    );
  }

  Widget _body(Size size) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/selector_background.jpg"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _areaDeIntercambio(size),
          _areaRecetasMatches(size),
        ],
      ),
    );
  }

  Widget _areaDeIntercambio(Size size) {
    List<Ingrediente> ingredientesPasados = new List<Ingrediente>();
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.02),
      width: size.width,
      height: size.height * 0.6,
      child: Row(
        children: <Widget>[
          GridSeleccion(ingredientesPasados),
          Container(
            color: black,
            height: size.height * 0.57,
            width: 1,
          ),
          _gridElegidos(size)
        ],
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 7,
            spreadRadius: 3.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
    );
  }

  bool existeIngrediente(
      List<Ingrediente> listaPasada, Ingrediente ingrediente) {
    for (var i = 0; i < listaPasada.length; i++) {
      if (listaPasada[i].id == ingrediente.id) return true;
    }
    return false;
  }

  Widget _gridElegidos(Size size) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Container(
          child: DragTarget(
            onAccept: (Ingrediente ingrediente) {
              if (!existeIngrediente(listaPasada, ingrediente)) {
                listaPasada.add(ingrediente);
                setState(() {});
              }
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, position) {
                  Ingrediente ingrediente = listaPasada[position];

                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          CustomDialogIngrediente(context, ingrediente, size)
                              .build(context);
                        },
                        child: ContenedorIngredienteWidget(
                          seleccionOElegido: false,
                          ingrediente: ingrediente,
                          size: size,
                          tamanno: size.width * 0.22,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() => listaPasada.remove(ingrediente));
                        },
                        child: Container(
                          //margin: EdgeInsets.all(size.width * 0.01),
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.cancel,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: listaPasada.length,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _areaRecetasMatches(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.25,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 7,
            spreadRadius: 3.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: FutureBuilder<List<Receta>>(
        future: provider.getRecetas(),
        builder: (context, snapshot) {
          var childCount = 0;
          List<Receta> recetasMatches = new List<Receta>();
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == null)
            childCount = 0;
          else
            childCount = snapshot.data.length;

          List<Receta> recetas = snapshot.data ?? [];
          if (listaPasada.length > 0) {
            recetasMatches = new List<Receta>();
            recetasMatches = _recetasMatches(recetas, listaPasada);
            childCount = recetasMatches.length;
          } else {
            recetasMatches = [];
            childCount = 0;
          }
          return ListView.builder(
            padding: EdgeInsets.all(size.width * 0.02),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Receta receta = recetasMatches[index];
              return _contenedorRecetaMatches(size, receta);
            },
            itemCount: childCount,
          );
        },
      ),
    );
  }

  Widget _contenedorRecetaMatches(Size size, Receta receta) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: receta);
      },
      child: Container(
        padding: EdgeInsets.all(size.width * 0.01),
        margin: EdgeInsets.all(size.width * 0.01),
        height: size.height * 0.25,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              spreadRadius: 3.5,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: receta.id,
              child: Container(
                width: size.width * 0.17,
                height: size.width * 0.17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      spreadRadius: 1.5,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: FadeInImage(
                  image: NetworkImage(receta.imagen),
                  placeholder: AssetImage("assets/images/loading.gif"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.width * 0.01,
                  right: size.width * 0.01,
                  left: size.width * 0.01),
              child: Text(
                receta.nombre,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.none,
                    fontFamily: "Montserrat-Medium",
                    fontSize: size.width * 0.025),
              ),
            ),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _iconoDificultad(size, receta),
                  _iconoCalificacion(size, receta),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _iconoDificultad(Size size, Receta receta) {
  return Container(
    height: size.width * 0.04,
    alignment: Alignment.center,
    child: Icon(
      Icons.lens,
      color: getIconColorDificultad(receta),
      size: size.width * 0.04,
    ),
  );
}

Widget _iconoCalificacion(Size size, Receta receta) {
  return Container(
    child: Container(
        height: size.width * 0.04, child: getIconCalificacion(receta)),
  );
}

List<Receta> _recetasMatches(
    List<Receta> recetas, List<Ingrediente> listaPasada) {
  List<Receta> recetasMatches = new List<Receta>();
  int matches = 0;

  for (var j = 0; j < recetas.length; j++) {
    for (var x = 0; x < recetas[j].ingredientes.length; x++) {
      for (var i = 0; i < listaPasada.length; i++) {
        if (listaPasada[i].id == recetas[j].ingredientes[x][0]) {
          matches++;
        }
      }
    }
    if (matches == listaPasada.length) {
      recetasMatches.add(recetas[j]);
    }
    matches = 0;
  }

  return recetasMatches;
}
