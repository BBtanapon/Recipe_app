import 'package:flutter/material.dart';

//swiper
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/viewModel/categories_list.dart';

class SwiperCategories extends StatelessWidget {
  final controller = PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
              future: recetasProvider.cargarCategories(),
              initialData: [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                return PageView(
                  controller: controller,
                  children: categoriesList(context),
                );
              },
            );
          },
          itemCount: 3,
          layout: SwiperLayout.DEFAULT,
        ));
  }
}
