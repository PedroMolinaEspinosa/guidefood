import 'package:flutter/material.dart';
import 'package:guidefood/src/controllers/api_provider.dart';
import 'package:guidefood/src/models/ingredient.dart';
import 'package:guidefood/src/vista/widgets/drag_box.dart';

class GridSeleccion extends StatelessWidget {
  final List<Ingrediente> ingredientesPasados;
  GridSeleccion(this.ingredientesPasados);
  final RecetasProvider provider = new RecetasProvider();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _gridSeleccion(size, ingredientesPasados);
  }

  Widget _gridSeleccion(Size size, List<Ingrediente> ingredientesPasados) {
    return Flexible(
      flex: 2,
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
}
