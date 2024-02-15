import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavorite(widget.meal);
            },
            icon: Icon(
              favoriteMeals.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              "Malzemeler:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (final ingredient in widget.meal.ingredients)
              Text("- $ingredient"),
            SizedBox(height: 16),
            Text(
              "Tarif:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(widget.meal.recipe),
          ],
        ),
      ),
    );
  }
}
