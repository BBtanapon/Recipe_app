import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/app_bar_categories.dart';
import 'package:recipe_app/src/widgets/app_bar_detail.dart';
import 'package:recipe_app/src/widgets/swiper_ingredient.dart';
import 'package:recipe_app/src/widgets/title.dart';

class Detallepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receta =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(slivers: <Widget>[
        appBarDetail(receta['foto']),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: _bodyReceta(receta, titlesRecipeStyleDetail),
          ),
          titles('Ingredientes', titlesStyle),
          SizedBox(
            height: 20.0,
          ),
          SliderIngredientes(receta['ingredientes']),
          SizedBox(
            height: 15.0,
          ),
          titles('Preparation', titlesStyle),
          _textDescription(receta['preparacion'])
        ]))
      ]),
    );
  }
}

Widget _bodyReceta(Map<String, dynamic> receta, TextStyle estilos) {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          receta['titulo'],
          textAlign: TextAlign.left,
          style: estilos,
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            receta['descripcion'],
            textAlign: TextAlign.left,
            style: descriptionStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.alarm, color: colorIcon),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          receta['duracion'],
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              color: colorTitle,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.fastfood, color: colorIcon),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          receta['dificultad'],
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              color: colorTitle,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

Widget _textDescription(String texto) {
  return Container(
    margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
    child: Text(
      texto,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(15, 55, 91, 1),
        fontSize: 14.0,
      ),
    ),
  );
}
