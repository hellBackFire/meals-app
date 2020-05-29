import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMeals extends StatelessWidget {
  // const CategoryMeals({Key key, this.title, this.id}) : super(key: key);
  final List<Meal> available;

  const CategoryMeals(this.available);
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeargs["title"];
    final id = routeargs["id"];
    final meals =
        available.where((item) => item.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: meals[index].id,
          title: meals[index].title,
          imageUrl: meals[index].imageUrl,
          affordability: meals[index].affordability,
          complexity: meals[index].complexity,
          duration: meals[index].duration,
        ),
        itemCount: meals.length,
      ),
    );
  }
}
