import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

//stateful widget => ConsumerStatefulWidget
//State => ConsumerState
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
            icon: Icon(favoriteMeals.contains(widget.meal)
                ? Icons.favorite
                : Icons.favorite_border),
          )
        ],
      ),
      body: Text(widget.meal.name),
    );
  }
}