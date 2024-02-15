import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';

const categories = [
  Category(id: "1", name: "Başlangıçlar", color: Colors.purple),
  Category(id: "2", name: "Ara Sıcaklar", color: Colors.pink),
  Category(id: "3", name: "Ana Yemekler", color: Colors.yellow),
  Category(id: "4", name: "Tatlılar", color: Colors.red),
  Category(id: "5", name: "İçecekler", color: Colors.blue),
  Category(id: "6", name: "Mezeler", color: Colors.lightGreenAccent)
];

final meals = [
  Meal(
    id: "1",
    categoryId: "1",
    name: "Mercimek Çorbası",
    imageUrl: "imageUrl",
    ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
    recipe: "Mercimek çorbasının tarifi burada.", // Yemek tarifi
  ),
  Meal(
    id: "2",
    categoryId: "2",
    name: "Ara Sıcaklar",
    imageUrl: "imageUrl",
    ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
    recipe: "Mercimek çorbasının tarifi burada.",
  )
];
