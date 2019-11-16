import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/ingredient.dart';
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
      appBar: getAppBar(context, marron70, size.width * 0.1),
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
      flex: 1,
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
                width: size.width,
                height: size.height * 0.5,
                child: Text("Error de conexion"),
              ));
            } else
              childCount = snapshot.data.length;

            List<Ingrediente> listaIngredientes = snapshot.data;

            return GridView.builder(
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

  Widget _gridElegidos(Size size) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Container(
          child: DragTarget(
            onAccept: (Ingrediente ingrediente) {
              //comprobación si el ingrediente ya está añadido
              listaPasada.add(ingrediente);
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, position) {
                  Ingrediente ingrediente = listaPasada[position];

                  return ContenedorIngredienteWidget(
                    ingrediente: ingrediente,
                    size: size,
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
    );
  }

  FutureBuilder<List<Ingrediente>> _getIngredientesCards(BuildContext context) {
    final apiProvider = RecetasProvider();

    return FutureBuilder(
      future: apiProvider.getIngredientes(),
      builder: (context, snapshot) {
        //print(snapshot.data[2].toString());
        var childCount = 0;
        if (snapshot.connectionState != ConnectionState.done ||
            snapshot.hasData == null)
          childCount = 0;
        else
          childCount = snapshot.data.length;

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            List<Ingrediente> ingredientes = snapshot.data;
            Ingrediente ingrediente = ingredientes[index];
            childCount = ingredientes.length;
            return Container(
              width: 50,
              height: 50,
              child: Image(
                image: NetworkImage(ingrediente.imagen),
              ),
            );
          }),
          itemCount: childCount,
        );
      },
    );
  }
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
            size: widget.size, ingrediente: widget.ingrediente),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Opacity(
          opacity: 0.7,
          child: ContenedorIngredienteWidget(
              size: widget.size, ingrediente: widget.ingrediente),
        ),
      ),
    );
  }
}
