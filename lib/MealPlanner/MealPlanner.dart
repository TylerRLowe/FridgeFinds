import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';

class MealPlanner extends StatelessWidget {
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
            Text('Meal Planner'),
          ],
        ),
      ),
      drawer: Menu(),
      body: Center(
        child: Text('Your meal planner details will appear here.'),
      ),
    );
  }
}
