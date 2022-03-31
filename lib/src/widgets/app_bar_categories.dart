import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarCategories(String title) {
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    elevation: 0.0,
    // title: Text(title, style: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   color: colorTitle,
    //   )),
    iconTheme: IconThemeData(color: colorIconAppBar),
  );
}
