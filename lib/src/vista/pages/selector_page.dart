import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/controlador_pantalla..dart';
import 'package:guidefood/src/styles/estilo.dart';
import 'package:guidefood/src/vista/widgets/appBar_%20widget.dart';

class SelectorPage extends StatefulWidget {
  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Scaffold(
      appBar: getAppBar(context, marron70, size.width * 0.1),
      
    );
  }
}
