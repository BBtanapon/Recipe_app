import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

import 'package:recipe_app/src/viewModel/categories_list.dart';
import 'package:recipe_app/src/viewModel/recatas_list.dart';

import 'package:recipe_app/src/widgets/app_bar_categories.dart';
import 'package:recipe_app/src/widgets/title.dart';

import 'package:recipe_app/src/provider/recetas_provider.dart';

class Categoriespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> categoria =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarCategories(categoria["nombre"]),
          SliverList(
              delegate: SliverChildListDelegate([
            titles(categoria["nombre"], titlesStyleCategories),
            FutureBuilder(
              future:
                  recetasProvider.cargarRecetaCategorias(categoria["nombre"]),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Column(
                    children: recipeListtodo(context, snapshot.requireData));
              },
            )
            //swiperPopular(),
          ]))
        ],
      ),
    );
  }
}
