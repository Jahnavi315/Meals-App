import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorities_provider.dart';

class MealDetailsScreen extends ConsumerWidget{
  const MealDetailsScreen({super.key,required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {//this other paramter is for listening to providers
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold( 
      appBar: AppBar( 
        title:Text(meal.title) ,
        actions: [
           IconButton(
            onPressed: (){
              final isFavorite = ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(isFavorite?'Removed from Favorites':'Added to Favorites')
              ),
    );
            } , 
            icon: Icon(isFavorite? Icons.star : Icons.star_border)
            ),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15),
            for(final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              )
            ),
            const SizedBox(height: 25),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15),
            for(final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
              child: Text(
                textAlign : TextAlign.center,
                softWrap : true, 
                step,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}