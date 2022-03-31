import 'package:flutter/material.dart';

import 'package:recipe_app/src/provider/recetas_provider.dart';

//styles
import "package:recipe_app/src/styles/styles.dart";
import 'package:recipe_app/src/viewModel/recatas_list.dart';

//widgets
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/menu_sidebar.dart';
import 'package:recipe_app/src/widgets/swiper_popular.dart';
import 'package:recipe_app/src/widgets/swiper_categories.dart';
import 'package:recipe_app/src/widgets/title.dart';

class Homepage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menuSide(context),
        key: _scaffoldKey,
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, _scaffoldKey),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    swiperPopular(),
                    titles('Categories', titlesStyle),
                    SwiperCategories(),
                    titles('Recipe Populars', titlesStyle),
                    FutureBuilder(
                      future: recetasProvider.cargarRecetasPopulares(),
                      initialData: [],
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        return Column(
                            children:
                                recipeListtodo(context, snapshot.requireData));
                      },
                    ),
                  ],
                )
              ]),
            )
          ],
        ));
  }
}
