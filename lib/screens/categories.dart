import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({super.key,required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  void _selectCategory(BuildContext context,Category category){
    //this context is related to category grid item
    final filteredMeals  =  widget.availableMeals.where(
      (meal) => meal.categories.contains(category.id)).toList();
      Navigator.of(context).push(MaterialPageRoute(builder: (cxt){
      return MealsScreen(meals: filteredMeals, title: category.title);
    }
    )
    );
    //Navigator.push(context, MaterialPageRoute(builder: builder))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,//size ratio of child's width to ht
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: (){
                _selectCategory(context,category);
              }
            )
        ],
      ),
    );
  }
}