import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen>{
  final List<Meal> _favoriteMeals=[];
  var _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message)
      ),
    );
  }
  void _toggleFavoriteMealStatus(Meal meal){
    final bool isExisting = _favoriteMeals.contains(meal);
    if(isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showSnackBar('Removed from Favorites');
    }else{
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showSnackBar('Added to Favorites');
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget activeScreen =  CategoriesScreen(onToggleFavorite: _toggleFavoriteMealStatus);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activeScreen = MealsScreen(meals: _favoriteMeals,onToggleFavorite: _toggleFavoriteMealStatus);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,//to indicate which tab is shown
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites')
        ]
      ),
    );
  }
}