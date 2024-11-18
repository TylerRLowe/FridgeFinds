import 'package:flutter/material.dart';
import 'shoppingList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            SizedBox(width: 10),
            Text('Home Page'),
          ],
        ),
      ),
      drawer: Drawer(
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
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have # expired ingredients!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 8),
                Text(
                  'View',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Explore Recipe'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
