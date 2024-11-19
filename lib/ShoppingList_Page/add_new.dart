import 'package:flutter/material.dart';

class AddNewPage extends StatelessWidget {
  final String recipeName;
  final String recipeIngredients;

  AddNewPage({this.recipeName = '', this.recipeIngredients = ''}); // Making them optional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Recipe Name: $recipeName'),
            Text('Ingredients: $recipeIngredients'),
          ],
        ),
      ),
    );
  }
}
