import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/controllers/centralizador_metodos.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';
import 'package:guidefood/src/vista/widgets/drawer.dart';
import 'package:guidefood/src/vista/widgets/ingredientes_horizontal.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<DetallePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = getMediaSize(context);
    final Receta receta = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerGuideFood(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _parteSuperiorDesign(size, receta),
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _iconoDificultad(size, receta),
                      _iconoCalificacion(size, receta),
                    ],
                  ),
                  width: size.width,
                  height: size.height * 0.07,
                ),
                _nombreReceta(size, receta),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _apartadoCategoria(size, receta),
                    _iconoDuracion(size, receta),
                  ],
                ),
                _filaDeIngredientes(size, receta),
                _realizacion(size, receta),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.3, right: size.width * 0.3),
                ),
                SizedBox(height: 10)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _realizacion(Size size, Receta receta) {
    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.9,
          margin: EdgeInsets.only(
              top: size.height * 0.04,
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
                offset: Offset(0.0, 2.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _generarPasos(context, receta, size),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: size.width * 0.03),
            width: size.width * 0.4,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/background_realizacion.jpg"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 2.0)),
              ],
            ),
            child: Text(
                //'${currentUser.firstName} ${currentUser.lastName}  '
                'Realización',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

  Widget _nombreReceta(Size size, Receta receta) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      width: size.width,
      child: Center(
        child: Text(
          receta.nombre,
          style: nombreDetalle,
        ),
      ),
      height: size.height * 0.09,
    );
  }

  Widget _filaDeIngredientes(Size size, Receta receta) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      width: size.width * 0.9,
      height: size.height * 0.15,
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.04),
                width: size.width * 0.9,
                height: size.height * 0.14,
                child: Center(child: _getIngredientesCards(context, receta))),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
    );
  }

  Widget _apartadoCategoria(Size size, Receta receta) {
    return Container(
      padding: EdgeInsets.only(left: size.width * 0.07),
      child: Column(
        children: <Widget>[
          Text(
            'Categoría:',
            style: medianoTextStyle,
          ),
          Container(
            width: size.width * 0.2,
            //padding: EdgeInsets.only(left: 3),
            child: Text(
              receta.categoria,
              style: medianoTextStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
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
        ],
      ),
      child: Hero(
          tag: receta.id,
          child: FadeInImage(
              placeholder: AssetImage("assets/images/loading.gif"),
              image: _avatar)),
    );
  }

  List<Widget> _generarPasos(BuildContext context, Receta receta, Size size) {
    List<Widget> listaIntrucciones = new List<Widget>();
    listaIntrucciones.add(
      SizedBox(height: size.height * 0.07),
    );
    for (var i = 0; i < receta.descripcion.length; i++) {
      final contenedor = new Container(
        padding: EdgeInsets.all(size.width * 0.03),
        margin: EdgeInsets.only(
            bottom: size.height * 0.02,
            right: size.width * 0.02,
            left: size.width * 0.02),
        child: Text(
          receta.descripcion[i],
          style: listaIntruccionesTextStyle,
          textAlign: TextAlign.justify,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("assets/images/background_instrucciones.jpg"),
              fit: BoxFit.fill),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
      );
      listaIntrucciones.add(contenedor);
    }
    listaIntrucciones.add(
      SizedBox(height: 20),
    );
    return listaIntrucciones;
  }

  FutureBuilder<List<Ingrediente>> _getIngredientesCards(
      BuildContext context, Receta receta) {
    final apiProvider = RecetasProvider();

    return FutureBuilder(
      future: apiProvider.getIngredientes(),
      builder: (context, projectSnap) {
        //print(projectSnap.data[2].toString());
        var childCount = 0;
        if (projectSnap.connectionState != ConnectionState.done ||
            projectSnap.hasData == null)
          childCount = 0;
        else
          childCount =
              getListaIngredientesReceta(projectSnap.data, receta).length;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            List<Ingrediente> ingredientes = projectSnap.data;
            Ingrediente ingrediente =
                getListaIngredientesReceta(ingredientes, receta)[index];
            childCount =
                getListaIngredientesReceta(ingredientes, receta).length;
            return IngredientesHorizontal(
              ingrediente: ingrediente,
              receta: receta,
            );
          }),
          itemCount: childCount,
        );
      },
    );
  }

  List<Ingrediente> getListaIngredientesReceta(
      List<Ingrediente> lista, Receta receta) {
    List<Ingrediente> listaReceta = new List<Ingrediente>();

    for (var x = 0; x < receta.ingredientes.length; x++) {
      for (var i = 0; i < lista.length; i++) {
        if (receta.ingredientes[x][0] == lista[i].id) {
          Ingrediente ingrediente = lista[i];
          ingrediente.cantidad = receta.ingredientes[x][1];
          listaReceta.add(ingrediente);
        }
      }
    }
    return listaReceta;
  }

  Widget _iconoDuracion(Size size, Receta receta) {
    return Container(
      margin: EdgeInsets.only(right: size.width * 0.045),
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            child: Image(
              image: AssetImage("assets/iconos/clockImage.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: size.width * 0.2,
            child: Text(
              receta.duracion,
              style: medianoTextStyle,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _parteSuperiorDesign(Size size, Receta receta) {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            //margin: EdgeInsets.only(top: size.height * 0.05),
            decoration: BoxDecoration(
                color: primaryColorDark,
                image: DecorationImage(
                    image: AssetImage("assets/images/maera.jpg"),
                    fit: BoxFit.fill)), //modificado
            height: size.height / 4,
            width: size.width,
          ),
          clipper: BottomWaveProfileClipper(),
        ),
        Container(
            height: size.height * 0.1,
            child: getAppBar(context, transparente, 17, _scaffoldKey)),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.05),
          child: _buildAvatar(receta, context),
        ),
      ],
    );
  }

  Widget _iconoDificultad(Size size, Receta receta) {
    return Container(
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
    );
  }

  Widget _iconoCalificacion(Size size, Receta receta) {
    return Container(
      padding: EdgeInsets.only(right: size.width * 0.1),
      child: Column(
        children: <Widget>[
          Container(height: 30, child: getIconCalificacion(receta)),
          Container(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              receta.calificacion.toString(),
              style: calificationTile,
              textAlign: TextAlign.center,
            ),
          )
        ],
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
