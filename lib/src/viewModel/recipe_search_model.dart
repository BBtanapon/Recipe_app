import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/src/styles/styles.dart';

List<Widget> recipeListtodo(
    BuildContext context, List<dynamic> recetas, String recetaBuscada) {
  final List<Widget> listadoRecetasEncontradas = [];

  recetas.forEach((receta) {
    var titulo = receta['titulo'].toString().toLowerCase();
    if (titulo.contains(recetaBuscada)) {
      final Widget recetaEncontrada =
          _receta(context, titlesRecipeStyle, receta);
      listadoRecetasEncontradas.add(recetaEncontrada);
    }
  });

  return listadoRecetasEncontradas;
}

Widget _receta(
    BuildContext context, TextStyle estilos, Map<String, dynamic> receta) {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 15.0, top: 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail', arguments: receta);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: NetworkImage(receta['foto']),
                      fit: BoxFit.fill,
                      width: 360.0,
                      height: 140.0,
                    ),
                  )),
              Text(
                receta['titulo'],
                textAlign: TextAlign.left,
                style: estilos,
              ),
              Text(
                receta['descripcion'],
                textAlign: TextAlign.left,
                style: descriptionStyle,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.clock, color: colorIcon),
                          Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(receta['duracion'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorTitle,
                                    fontSize: 14.0,
                                  )))
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.burger, color: colorIcon),
                          Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(receta['dificultad'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorTitle,
                                    fontSize: 14.0,
                                  )))
                        ],
                      ))
                ],
              ))
            ]),
      ),
    ],
  );
}
