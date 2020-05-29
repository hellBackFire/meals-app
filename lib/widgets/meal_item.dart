import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meals.dart';

class MealItem extends StatelessWidget {
 

  final String title, imageUrl, id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {Key key,
      this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability})
      : super(key: key);
 void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal_details', arguments: id);
    print(id);
  }
  String get getComplexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get getAffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.black54,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon((Icons.access_time)),
                          SizedBox(width: 5),
                          Text('$duration minutes',
                              style: Theme.of(context).textTheme.body1),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon((Icons.work)),
                          SizedBox(width: 5),
                          Text('$getComplexityText',
                              style: Theme.of(context).textTheme.body1),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.account_balance_wallet),
                          SizedBox(width: 5),
                          Text('$getAffordabilityText',
                              style: Theme.of(context).textTheme.body1),
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
