import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';

import '../SavedRecipes/SavedRecipes.dart';

class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  String _selectedView = 'Daily View';

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
        actions: [
          _buildViewSwitcher(),
        ],
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _selectedView == 'Daily View'
            ? DailyView()
            : WeeklyView(),
      ),
    );
  }

  Widget _buildViewSwitcher() {
    return DropdownButton<String>(
      value: _selectedView,
      dropdownColor: Colors.white,
      underline: SizedBox(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedView = newValue!;
        });
      },
      items: ['Daily View', 'Weekly View']
          .map<DropdownMenuItem<String>>((String view) {
        return DropdownMenuItem<String>(
          value: view,
          child: Text(view, style: TextStyle(color: Colors.black)),
        );
      }).toList(),
    );
  }
}

class DailyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingSection(title: 'Breakfast'),
        SizedBox(height: 20),
        HeadingSection(title: 'Lunch'),
        SizedBox(height: 20),
        HeadingSection(title: 'Dinner'),
      ],
    );
  }
}

class WeeklyView extends StatelessWidget {
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: days.map((day) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HeadingSection(title: day),
        );
      }).toList(),
    );
  }
}

class HeadingSection extends StatefulWidget {
  final String title;
  HeadingSection({required this.title});
  @override
  _HeadingSectionState createState() => _HeadingSectionState();
}

class _HeadingSectionState extends State<HeadingSection> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _showAddItemDialog(context);
              },
              child: Text('Add Meal'),
            ),
          ],
        ),
        if (items.isNotEmpty)
          Column(
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('• $item'),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          items.remove(item);
                        });
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  void _showAddItemDialog(BuildContext context) {
    String? selectedRecipe;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Meal'),
          content: DropdownButton<String>(
            value: selectedRecipe,
            isExpanded: true,
            onChanged: (String? newRecipe) {
              setState(() {
                selectedRecipe = newRecipe;
              });
            },
            items: savedRecipes.map<DropdownMenuItem<String>>((Map<String, dynamic> recipe) {
              return DropdownMenuItem<String>(
                value: recipe['recipeName'],
                child: Text(recipe['recipeName']),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (selectedRecipe != null) {
                  setState(() {
                    items.add(selectedRecipe!);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
