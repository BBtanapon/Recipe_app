import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/viewModel/recipe_search_model.dart';

class RecetasSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
        primaryColor: theme.primaryColorLight,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.primaryTextTheme,
        inputDecorationTheme: theme.inputDecorationTheme
            .copyWith(hintStyle: TextStyle(color: Colors.white60)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => this.query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => this.close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: recetasProvider.cargarRecetasPopulares(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<dynamic> recetasProvider = snapshot.data ?? [];

          var recetaBuscada = this.query.toLowerCase();

          return CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                    children:
                        recipeListtodo(context, recetasProvider, recetaBuscada))
              ]))
            ],
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Busca tu receta favorita...',
          style: descriptionStyle,
        ));
  }
}
