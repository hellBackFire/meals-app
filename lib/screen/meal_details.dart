import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourite;
  const MealsDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget getTitle(context, text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: Theme.of(context).textTheme.title),
      ),
    );
  }

  Widget getList(context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 175,
        width: MediaQuery.of(context).size.width * 0.9,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeals.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              selectedMeals.imageUrl,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              height: 300,
              width: double.infinity,
            ),
            getTitle(context, "Ingredients"),
            getList(
              context,
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeals.ingredients[index],
                          style: TextStyle(fontSize: 17),
                        ),
                      ));
                },
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            getTitle(context, "Steps"),
            getList(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(selectedMeals.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeals.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavourite(mealId),
        child: 
        Icon(isFavourite(mealId)?Icons.star:Icons.star_border),
      ),
    );
  }
}
