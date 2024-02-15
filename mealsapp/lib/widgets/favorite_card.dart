import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';
import 'package:mealsapp/screens/meal_details.dart';

class FavoritesCard extends ConsumerWidget {
  const FavoritesCard({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                meal.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorite(meal);
              },
            ),
          ]),
        ]),
      ),
    );
  }
}
