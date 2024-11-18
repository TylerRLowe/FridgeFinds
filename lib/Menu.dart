import 'package:flutter/material.dart';
import 'ShoppingList_Page/shoppingList.dart';
import 'Home_Page/HomePage.dart';
import 'UserProfile/UserProfile.dart';
import 'ExpiredRecipe//pantry.dart';
import 'SavedRecipes/SavedRecipes.dart';
import 'MealPlanner/MealPlanner.dart';
import 'ExploreRecipe/exploreRecipe.dart';

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
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Saved Recipes'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SavedRecipes()),
              );
            },
          ),
          ListTile(
            title: Text('Meal Planner'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MealPlanner()),
              );
            },
          ),
          ListTile(
            title: Text('Expired Recipes'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ExpiredRecipes()),
              );
            },
          ),
          ListTile(
            title: Text('Shopping List'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShoppingList()),
              );
            },
          ),
          ListTile(
            title: Text('Explore Recipe'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Pantry()),
              );
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
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
