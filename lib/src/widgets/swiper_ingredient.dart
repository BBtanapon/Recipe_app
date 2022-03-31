import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/viewModel/ingredient_list.dart';

Widget SliderIngredientes(List<dynamic> ingredientes) {
  final controller = PageController(initialPage: 1, viewportFraction: 0.3);

  return Container(
    height: 120.0,
    padding: EdgeInsets.only(left: 5.0),
    child: Swiper(
        itemCount: 1,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            controller: controller,
            children: listadoIngredientes(ingredientes),
          );
        }),
  );
}
