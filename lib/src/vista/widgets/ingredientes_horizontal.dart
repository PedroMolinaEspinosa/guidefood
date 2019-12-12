import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/custom_dialog_ingrediente.dart';

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
                    placeholder: AssetImage("assets/images/loading-burger.gif"),
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
