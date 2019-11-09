import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/estilo.dart';

class IngredientesHorizontal extends StatelessWidget {
  Receta receta;
  Ingrediente ingrediente;

  IngredientesHorizontal({@required this.receta, @required this.ingrediente});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return _tarjeta(context, ingrediente, screenSize);
  }

  Widget _tarjeta(
      BuildContext context, Ingrediente ingrediente, Size screenSize) {
    final tarjeta = GestureDetector(
      onTap: () {
        CustomDialogIngrediente(context, ingrediente, screenSize)
            .build(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: screenSize.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Hero(
                  tag: ingrediente.imagen,
                  child: FadeInImage(
                    image: NetworkImage(ingrediente.imagen),
                    placeholder: AssetImage('assets/images/no-conection.png'),
                    fit: BoxFit.fill,
                    height: screenSize.height * 0.07,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: screenSize.height * 0.03,
                child: Text(
                  "${ingrediente.cantidad} ${ingrediente.medida}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 0.5,
                  offset: Offset(2.0, 4.0)),
            ],
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detalle-ingrediente",
            arguments: ingrediente);
      },
      child: tarjeta,
    );
  }
}

class CustomDialogIngrediente extends AlertDialog {
  CustomDialogIngrediente(
      BuildContext context, Ingrediente ingrediente, Size size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: size.width * 0.9,
              height: size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _iconoCerrarDialog(size, context),
                  _contenidoDialog(size, ingrediente),
                ],
              ),
              decoration: BoxDecoration(
                color: white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 0.5,
                      offset: Offset(0.0, 2.0)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _contenidoDialog(Size size, Ingrediente ingrediente) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: size.width * 0.02),
          width: size.width * 0.25,
          height: size.width * 0.25,
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
            tag: ingrediente.imagen,
            child: FadeInImage(
              placeholder: AssetImage("assets/images/loading-burger.gif"),
              image: NetworkImage(ingrediente.imagen),
              width: size.width * 0.2,
              height: size.width * 0.2,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${ingrediente.nombre}",
                overflow: TextOverflow.ellipsis,
                style: medianoTextStyle,
              ),
              Text(
                "${ingrediente.tipo}",
                overflow: TextOverflow.ellipsis,
                style: titleTile,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${ingrediente.cantidad}",
                      overflow: TextOverflow.ellipsis,
                      style: titleTile,
                    ),
                    Text(
                      "${ingrediente.medida}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: titleTile,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconoCerrarDialog(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(
                top: size.height * 0.02, right: size.height * 0.02),
            child: ImageIcon(
              AssetImage("assets/iconos/Material icons-01-34.png"),
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
