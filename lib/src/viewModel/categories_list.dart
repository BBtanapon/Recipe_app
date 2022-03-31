import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';

List<Widget> categoriesList(BuildContext context) {
  final List<Widget> listcategories = [];
  final List<dynamic> categories = recetasProvider.categories;

  categories.forEach((categorie) {
    final Widget widgetProv = _imageCategories(context, categorie);
    listcategories.add(widgetProv);
  });

  return listcategories;
}

Widget _imageCategories(BuildContext context, Map<String, dynamic> categorie) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'categories', arguments: categorie);
    },
    child: Container(
      child: Stack(
        children: [
          Container(
            width: 130.0,
            height: 100.0,
            margin: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(categorie['foto']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20.0),
            child: Text(categorie['nombre'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.wavy,
                )),
          )
        ],
      ),
    ),
  );
}
