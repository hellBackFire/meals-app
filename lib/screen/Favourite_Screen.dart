import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../models/meals.dart';

class FavouriteScreen extends StatelessWidget {

final List<Meal> favourite;

  const FavouriteScreen(this.favourite);

  @override
  Widget build(BuildContext context) {
    
   if(favourite.isEmpty)
   return Center(child:Text("No Favourites Has Been Added"));
   else{
     return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: favourite[index].id,
          title: favourite[index].title,
          imageUrl: favourite[index].imageUrl,
          affordability: favourite[index].affordability,
          complexity: favourite[index].complexity,
          duration: favourite[index].duration,
        ),
        itemCount: favourite.length,
      );
   }
  }
}