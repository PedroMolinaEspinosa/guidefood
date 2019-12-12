import 'package:flutter/material.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/models/receta.dart';
import 'package:guidefood/src/styles/colores.dart';
import 'package:guidefood/src/styles/estilo.dart';

class CustomDialogCalificacion extends AlertDialog {
  CustomDialogCalificacion(BuildContext context, Receta receta, Size size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Scaffold(
          backgroundColor: transparente,
          body: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _iconoCerrarDialog(size, context),
                    _contenidoDialog(size, receta, context),
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
          ),
        );
      },
    );
  }

  Widget _contenidoDialog(Size size, Receta receta, BuildContext context) {
    double _radioValue;
    return Form(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Image.asset("assets/iconos/heart0.png"),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset("assets/iconos/heart25.png"),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset("assets/iconos/heart50.png"),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset("assets/iconos/heart75.png"),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset("assets/iconos/heart100.png"),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: size.height * 0.27,
            width: size.width * 0.8,
            child: TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                hintMaxLines: 4,
                hintText: "Escribe tu comentario",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: black20, width: 1, style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: black20, width: 1, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              width: size.width * 0.4,
              height: size.height * 0.07,
              child: FlatButton(
                child: Text("ENVIAR"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
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
