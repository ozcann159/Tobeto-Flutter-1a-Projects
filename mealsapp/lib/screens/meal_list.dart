import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/categories_provider.dart';
import 'package:mealsapp/providers/filters_provider.dart';
import 'package:mealsapp/widgets/meal_card.dart';

class MealList extends ConsumerWidget {
  const MealList({Key? key, required this.meals}) : super(key: key);
  final List<Meal> meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterMealsFromState = ref.watch(filterMealsProvider);
    final selectedCategoryFromState = ref.watch(selectedCategoryNameProvider);

    Widget widget = ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filterMealsFromState.length,
        itemBuilder: (ctx, index) =>
            MealCard(meal: filterMealsFromState[index]));

    if (filterMealsFromState.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir içerik bulunmamaktadır."),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedCategoryFromState),
        ),
        body: widget);
  }
}