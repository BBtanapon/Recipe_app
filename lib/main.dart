import 'package:flutter/material.dart';
import 'package:recipe_app/src/pages/categories.dart';
import 'package:recipe_app/src/pages/details_recipe.dart';
import 'package:recipe_app/src/pages/home_page.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColorLight: colorTitle,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Homepage(),
          'categories': (BuildContext context) => Categoriespage(),
          'detail': (BuildContext context) => Detallepage(),
        });
  }
}
