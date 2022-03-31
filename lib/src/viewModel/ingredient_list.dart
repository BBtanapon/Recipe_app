import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';

List<Widget> listadoIngredientes(List<dynamic> ingredientes) {
  final List<Widget> listadoIngredientes = [];
  final List<dynamic> ingredientesReceta = ingredientes;

  ingredientesReceta.forEach((ingrediente) {
    final Widget listadoIngredientesTemp = _image(ingrediente);
    listadoIngredientes.add(listadoIngredientesTemp);
  });

  return listadoIngredientes;
}

Widget _image(Map<String, dynamic> ingredient) {
  return Center(
    child: Stack(
      children: [
        Container(
            width: 130.0,
            height: 100.0,
            margin: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(ingredient['fotoIngrediente']),
                //color: colorTitle,
                //colorBlendMode: BlendMode.overlay,
                fit: BoxFit.cover,
              ),
            )),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(ingredient['ingrediente'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    )
                  ])),
        )
      ],
    ),
  );
}
