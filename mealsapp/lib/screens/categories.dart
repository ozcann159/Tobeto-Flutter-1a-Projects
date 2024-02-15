import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/categories_provider.dart';
import 'package:mealsapp/providers/filters_provider.dart';
import 'package:mealsapp/providers/meals_provider.dart';
import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/screens/meal_list.dart';
import 'package:mealsapp/widgets/category_card.dart';
import 'package:mealsapp/widgets/custom_drawer.dart';

class Categories extends ConsumerWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsFromState = ref.watch(mealsProvider);
    final categoriesFromState = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bir kategori seçin"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Favorites()));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      drawer: CustomDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in categoriesFromState)
            CategoryCard(
              category: category,
              onSelectCategory: () {
                ref
                    .read(selectedCategoryNameProvider.notifier)
                    .seledtedCategoryNameChange(category);
                ref
                    .read(filterMealsProvider.notifier)
                    .filteredMeals(category, mealsFromState);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) =>
                        MealList(meals: ref.watch(filterMealsProvider)),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
