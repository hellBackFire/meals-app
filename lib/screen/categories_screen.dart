import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      children: DUMMY_CATEGORIES
          .map((item) =>
              CategoryItems(id: item.id, color: item.color, title: item.title))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
