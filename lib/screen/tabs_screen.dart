import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/Favourite_Screen.dart';
import 'package:flutter_complete_guide/screen/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.favourite);

  @override
  _TabsScreenState createState() => _TabsScreenState();

  final List<Meal> favourite;
}

List<Map<String, Object>> pages;
var _selectedPageIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": FavouriteScreen(widget.favourite), "title": "Favourite"}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text("Meals"),
    //         bottom: TabBar(tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Category",
    //           ),
    //           Tab(icon: Icon(Icons.favorite), text: "Favourite")
    //         ]),
    //       ),
    //       body: TabBarView(children: [CategoriesScreen(),FavouriteScreen()]),
    //     ));
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          elevation: 5,
          child: MainDrawer(),
        ),
      ),
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text("Favourite"))
        ],
        onTap: (a) => _selectPage(a),
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
      ),
      body: pages[_selectedPageIndex]["page"],
    );
  }

  _selectPage(int a) {
    setState(() {
      _selectedPageIndex = a;
    });
  }
}
