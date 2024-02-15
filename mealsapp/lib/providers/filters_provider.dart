import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';

class FilterMealsNotifier extends StateNotifier<List<Meal>> {
  FilterMealsNotifier() : super([]);

  void filteredMeals(Category category, List<Meal> mealsProvider) {
    List<Meal> newState;

    newState = mealsProvider
        .where((element) => element.categoryId == category.id)
        .toList();

    state = newState;
  }
}

final filterMealsProvider =
    StateNotifierProvider<FilterMealsNotifier, List<Meal>>((ref) {
  return FilterMealsNotifier();
});