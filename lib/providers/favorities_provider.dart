import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealNotifier():super([]);//pass the initial data to be there
  bool toggleMealFavoriteStatus(Meal meal){
    //cant mutate the data of this data in memory,soa ssign new one
    final bool isFavorite = state.contains(meal);
    if(isFavorite){
      state = state.where((m) => m.id!=meal.id).toList();
      return true;
    }else{
      state = [...state,meal];
      return false;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref) => FavoriteMealNotifier());
//should also provide the data that being provided by FavoriteMealNotifier in the generic type def