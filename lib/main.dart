import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screen/category_meals.dart';
import 'package:flutter_complete_guide/screen/filters_screen.dart';
import 'package:flutter_complete_guide/screen/meal_details.dart';
import 'package:flutter_complete_guide/screen/tabs_screen.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    "vegeterian": false,
    "lactose": false
  };
  bool _isMealFavourite(String id) {
    return favourite.any((meal) => meal.id == id);
  }

  List<Meal> available = DUMMY_MEALS;
  List<Meal> favourite = [];
  void filterRecipes(Map<String, bool> filterdata) {
    setState(() {
      filters = filterdata;

      available = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegeterian'] && !meal.isVegetarian) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealID) {
    final existingIndex = favourite.indexWhere((meal) => meal.id == mealID);

    if (existingIndex == -1)
      setState(() {
        favourite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    else
      setState(() {
        favourite.removeAt(existingIndex);
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(221, 221, 200, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(favourite),
      routes: {
        "/category-meals": (_) => CategoryMeals(available),
        '/meal_details': (_) =>
            MealsDetailScreen(_toggleFavourites, _isMealFavourite),
        '/filter': (_) => FilterScreen(filterRecipes, filters)
      },
    );
  }
}
