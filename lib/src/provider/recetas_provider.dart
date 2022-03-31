import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:cloud_firestore/cloud_firestore.dart';

class _RecipeProvider {
  List<dynamic> recetasPopulares = [];
  List<dynamic> categories = [];
  List<dynamic> recetasCategorie = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<List<dynamic>> cargarRecetasPopulares() async {
  //   final resp = await rootBundle.loadString('data/recetas.json');
  //   Map<String, dynamic> recetasMap = json.decode(resp);
  //   recetasPopulares = recetasMap['recetasPopulares'];

  //   return recetasPopulares;
  // }

  // Future<List<dynamic>> cargarCategories() async {
  //   final resp = await rootBundle.loadString('data/recetas.json');

  //   Map<String, dynamic> categoriesMap = json.decode(resp);
  //   categories = categoriesMap['categorias'];

  //   return categories;
  // }

  // Future<List<dynamic>> cargarCategorie(String nameCategoria) async {
  //   final resp = await rootBundle.loadString('data/recetas.json');

  //   Map<String, dynamic> categorieMap = json.decode(resp);
  //   recetasCategorie = categorieMap[nameCategoria];

  //   return recetasCategorie;
  // }

  Future<List<dynamic>> cargarRecetasPopulares() async {
    final List<dynamic> recipesTempList = [];
    await firestore
        .collection("recetas")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> recipesMap =
                    doc.data()! as Map<String, dynamic>;
                recipesTempList.add(recipesMap);
              })
            });
    recetasPopulares = recipesTempList;
    return recetasPopulares;
  }

  Future<List<dynamic>> cargarCategories() async {
    final List<dynamic> categoriesTempList = [];
    await firestore
        .collection("categorias")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> categoriesMap =
                    doc.data()! as Map<String, dynamic>;
                categoriesTempList.add(categoriesMap);
              })
            });
    categories = categoriesTempList;
    return categories;
  }

  Future<List<dynamic>> cargarRecetaCategorias(String categoria) async {
    final List<dynamic> categoriaTempList = [];

    await firestore
        .collection(categoria)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> categoriaMap =
                    doc.data()! as Map<String, dynamic>;
                categoriaTempList.add(categoriaMap);
              })
            });
    recetasCategorie = categoriaTempList;
    return recetasCategorie;
  }
}

final recetasProvider = _RecipeProvider();
