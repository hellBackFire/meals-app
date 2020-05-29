import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listdrawer(icon, text,ctx,pageRoute) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 25),
      ),
      onTap: ()=>Navigator.of(ctx).pushReplacementNamed(pageRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    final percentHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        Container(
          height: percentHeight * 0.25,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          alignment: Alignment.center,
          child: Text(
            "Cooking Up!!!",
            style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
                fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        listdrawer(Icons.restaurant, "Meals",context,'/'),
        listdrawer(Icons.filter_list, "Filter",context,'/filter')
      ],
    );
  }
}
