import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;
  final Map<String, bool> currentFilters;
  FilterScreen(this.setFilter, this.currentFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactosefree = false;
  initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegan = widget.currentFilters["vegan"];
    _vegeterian = widget.currentFilters["vegeterian"];
    _lactosefree = widget.currentFilters["lactose"];
    super.initState();
  }

  Widget buildlisttile(text, subtext, presentVal, Function change) {
    return SwitchListTile(
      title: Text(text),
      value: presentVal,
      subtitle: Text(subtext),
      onChanged: change,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () => widget.setFilter({
            'gluten': _glutenFree,
            'vegan': _vegan,
            "vegeterian": _vegeterian,
            "lactose": _vegeterian
          }),
        )
      ]),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildlisttile(
                  "Gluten Free", "Only Gluten-free Meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildlisttile("Vegeterian", "Only Include Veg Meals", _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              buildlisttile("Vegan", "Only Include Vegan Meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              buildlisttile("Lactose Free", "Only Include LactoseFree Meals",
                  _lactosefree, (newValue) {
                setState(() {
                  _lactosefree = newValue;
                });
              })
            ],
          ))
        ],
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          elevation: 5,
          child: MainDrawer(),
        ),
      ),
    );
  }
}
