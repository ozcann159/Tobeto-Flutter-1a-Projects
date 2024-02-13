//dynamic state


// iki adet yapı

//notifier > değişiklikleri yönetecek class
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

//initial state = uygulama ilk ayağa kalktığı an
class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super ([]);  //initial state belirleme

  void toggleMealFavorite(Meal meal)
   {
    // state is immutable(değişmez,sabit) 
    // REPLACE
    List<Meal> newState = [];
    if (state.contains(meal)) {
      newState = state.where((element) => element.id == meal.id).toList();
    }else{
      newState = [...state,meal];
    }
    state = newState;
   }
}


// provider
final favoriteMealsProvider = StateNotifierProvider< FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});