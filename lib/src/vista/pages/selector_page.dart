import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/contenedor_ingrediente_widget.dart';

class SelectorPage extends StatefulWidget {
  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  RecetasProvider provider = new RecetasProvider();
  List<Ingrediente> listaPasada = new List<Ingrediente>();

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      appBar:
          getAppBar(context, primaryColor.withOpacity(0.8), size.width * 0.1),
      body: _body(size),
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
          _gridSeleccion(size, ingredientesPasados),
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

  Widget _gridSeleccion(Size size, List<Ingrediente> ingredientesPasados) {
    return Flexible(
      flex: 4,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: FutureBuilder<List<Ingrediente>>(
          future: provider.getIngredientes(),
          builder: (context, snapshot) {
            var childCount = 0;
            if (snapshot.connectionState != ConnectionState.done ||
                snapshot.hasData == null) {
              childCount = 0;
              return Center(
                  child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.5,
                child: Text("Error de conexion"),
              ));
            } else
              childCount = snapshot.data.length;

            List<Ingrediente> listaIngredientes = snapshot.data;

            return GridView.builder(
              padding: EdgeInsets.only(right: size.width * 0.1),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, position) {
                Ingrediente ingrediente = listaIngredientes[position];

                return DragBox(ingrediente, size);
              },
              itemCount: childCount,
            );
          },
        ),
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
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Container(
          child: DragTarget(
            onAccept: (Ingrediente ingrediente) {
              if (!existeIngrediente(listaPasada, ingrediente)) {
                listaPasada.add(ingrediente);
                print("lista pasada en gridelegidos ${listaPasada.length}");

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
                      ContenedorIngredienteWidget(
                        seleccionOElegido: false,
                        ingrediente: ingrediente,
                        size: size,
                        tamanno: size.width * 0.22,
                        color: Colors.orangeAccent,
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
            //print("${recetasMatches.length} recetasmatches2");
            print("lista pasada en futurematches ${listaPasada.length}");
          } else {
            recetasMatches = [];
            childCount = 0;
          }
          // print("cuenta de childcount $childCount");
          // print("${recetasMatches.length} recetasmatches");

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Receta receta = recetasMatches[index];
              return Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Image.network(receta.imagen),
              );
            },
            itemCount: childCount,
          );
        },
      ),
    );
  }
}

List<Receta> _recetasMatches(
    List<Receta> recetas, List<Ingrediente> listaPasada) {
  List<Receta> recetasMatches = new List<Receta>();
  int matches = 0;

  for (var j = 0; j < recetas.length; j++) {
    for (var x = 0; x < recetas[j].ingredientes.length; x++) {
      for (var i = 0; i < listaPasada.length; i++) {
        if (listaPasada[i].id == recetas[j].ingredientes[x][0]) {
          print(listaPasada[i].nombre);
          matches++;
        }
      }
    }
    if (matches == listaPasada.length) {
      recetasMatches.add(recetas[j]);
      //print(recetas[j].nombre);

    }
    matches = 0;
  }
  //print("lista pasada en getmatches ${listaPasada.length}");

  return recetasMatches;
}

class DragBox extends StatefulWidget {
  final Ingrediente ingrediente;
  final Size size;

  DragBox(this.ingrediente, this.size);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable(
        data: widget.ingrediente,
        child: ContenedorIngredienteWidget(
            seleccionOElegido: true,
            size: widget.size,
            ingrediente: widget.ingrediente),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Opacity(
          opacity: 0.7,
          child: Container(
            child: Image.network(widget.ingrediente.imagen),
            width: widget.size.width * 0.2,
            height: widget.size.width * 0.2,
          ),
        ),
      ),
    );
  }
}
