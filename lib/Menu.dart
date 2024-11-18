import 'package:flutter/material.dart';
import 'ShoppingList_Page/shoppingList.dart';
import 'Home_Page/HomePage.dart';
import 'UserProfile/UserProfile.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home Page'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            );
            },
          ),
          ListTile(
            title: Text('Saved Recipes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Meal Planner'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Expired Recipes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Shopping List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingList()),
              );
            },
          ),
          ListTile(
            title: Text('Pantry'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Userprofile()),
              );
            },
          ),
        ],
      ),
    );
  }
}
