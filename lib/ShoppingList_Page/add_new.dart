import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _recipeIngredientsController = TextEditingController();

  @override
  void dispose() {
    _recipeNameController.dispose();
    _recipeIngredientsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _recipeNameController,
              decoration: InputDecoration(
                labelText: 'Recipe Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _recipeIngredientsController,
              decoration: InputDecoration(
                labelText: 'Ingredients',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final recipeName = _recipeNameController.text;
                final ingredients = _recipeIngredientsController.text;

                if (recipeName.isNotEmpty && ingredients.isNotEmpty) {
                  Navigator.pop(context, {
                    'recipeName': recipeName,
                    'ingredient': ingredients,
                  });
                }
              },
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
