import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

import 'meal_detail_screen.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {this.title, required this.meals});

  final String? title;
  final List<Meal> meals;


  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MealDetailScreen(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Oh...No Meals are there ",
            style: TextStyle(fontSize: 25, color: Colors.orangeAccent),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Try some other Categories",
            style: TextStyle(fontSize: 25, color: Colors.orangeAccent),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: meals[index],
            onSelectedMeal: (Meal meal) {
              selectedMeal(context, meal);
            },
          );
        },
        itemCount: meals.length,
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
