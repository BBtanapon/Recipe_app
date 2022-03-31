import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/src/styles/styles.dart';

Drawer menuSide(context) {
  return Drawer(
    elevation: 0.0,
    child: Container(
      color: colorBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/food.jpg'), fit: BoxFit.cover)),
              child: Container(
                alignment: Alignment.center,
                child: Text('Recipe App', style: estilosTextMenuside),
              )),
          ListTile(
            leading: Icon(Icons.fastfood, color: colorIcon),
            title: Text('Categories'),
            onTap: () {
              Navigator.pushNamed(context, 'categories');
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: colorIcon),
            title: Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, 'categories');
            },
          )
        ],
      ),
    ),
  );
}
