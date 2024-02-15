import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.category, required this.onSelectCategory})
      : super(key: key);

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => onSelectCategory(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        shadowColor: Colors.white,
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.9),
                category.color.withOpacity(0.2),
              ],
              stops: const [0.2, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.restaurant,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
