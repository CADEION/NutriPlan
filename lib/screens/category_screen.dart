// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';
import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(context,Category category) {
   final  filteredCategoryList = availableMeals.where((meal) => meal.categories.contains(category.id))
       .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealScreen(title: category.title, meals: filteredCategoryList,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectedCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
