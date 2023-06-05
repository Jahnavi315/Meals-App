import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorities_provider.dart';
//import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
//import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen>{
  //final List<Meal> _favoriteMeals=[];
  //Map<Filter,bool> _selectedFilters = kInitialFilers;
  var _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  void _setScreen(String screen) async{
    Navigator.of(context).pop();
    if(screen=='Filters'){     
      //push can also return a future object, this is basically wt we returned in pop and can store here
      //final result = await 
      Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(
        builder: (cxt)=>const FiltersScreen()
      ));
      /*setState(() {
        _selectedFilters = result ?? kInitialFilers ;
      });*/
      
    }else{
      if(_selectedPageIndex==1){
        setState(() {
          _selectedPageIndex=0;
        });
      }
    }
  }
  /*void _showSnackBar(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message)
      ),
    );
  }*/
  /*void _toggleFavoriteMealStatus(Meal meal){
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
  }*/
  @override
  Widget build(BuildContext context) {
    //final meals = ref.watch(mealsProvider);
    //final selectedFilters  = ref.watch(filtersProvider);
    final filteredMeals = ref.watch(filteredMealsProvider);
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    Widget activeScreen =  CategoriesScreen(availableMeals: filteredMeals);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activeScreen = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(  
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
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