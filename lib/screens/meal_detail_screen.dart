import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import '../models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favoriteMealsNotifier.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(favoriteMealsProvider.notifier)
                      .toggleMealFavouriteStatus(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(wasAdded ? 'Meal added as a favorite' : 'Meal removed')));
                },
                icon: Icon(Icons.favorite_outlined))
          ],
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Steps",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.steps)
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ));
  }
}

// Container(
// child: Column(
// children: [
// Text(meal.title,style: TextStyle(color: Colors.cyan),),
// ListView.builder(itemBuilder: (context,index){
// return Text(meal.ingredients[index]);
// },itemCount: meal.ingredients.length,),
// ],
// ),
// );
