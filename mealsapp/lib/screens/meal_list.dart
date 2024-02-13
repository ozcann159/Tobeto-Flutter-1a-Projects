import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/meals_provider.dart';
import 'package:mealsapp/widgets/meal_card.dart';
//Provider' da erişmek isteyen widgetlar
//RiverPod widgetları olmalı

//StatelessWidget = ConsumerWidget

class MealList extends ConsumerWidget {
  const MealList({Key? key, required this.meals}) : super(key: key);
  final List<Meal> meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsFromState = ref.watch(mealsProvider);

    Widget widget = ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: meals.length,
        itemBuilder: (cyx, index) => MealCard(meal: meals[index]));

    if (meals.isEmpty) {
      widget = Center(
        child: Text("Bu kategoride hiçbir içerik bulunmamaktadır"),
      );
    } else {
      widget = ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: meals.length,
        itemBuilder: (context, index) => MealCard(meal: meals[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Listesi"),
      ),
      body: widget,
    );
  }
}
