import 'package:flutter/material.dart';


class CategoryItems extends StatelessWidget {
  final Color color;
  final String title, id;

  const CategoryItems({Key key, this.color, this.title, this.id});
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meals', arguments: {'id': id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return InkWell(
          borderRadius: BorderRadius.circular(constraint.maxWidth * 0.07),
          splashColor: Theme.of(context).primaryColorDark,
          onTap: () => selectCategory(context),
          child: GridTile(
            child: Padding(
              padding: EdgeInsets.all(constraint.maxHeight * 0.01),
              child: Container(
                padding: EdgeInsets.only(
                    left: constraint.maxWidth * 0.1,
                    top: constraint.maxHeight * 0.1),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.title,
                ),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color.withOpacity(0.7), color],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft),
                  borderRadius:
                      BorderRadius.circular(constraint.maxWidth * 0.07),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
