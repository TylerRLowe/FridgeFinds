import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, String> recipeData;

  RecipeCard({required this.recipeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(recipeData['image']!), // Recipe image
            SizedBox(height: 10),
            Text(
              recipeData['name']!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              recipeData['description']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Ingredients:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(recipeData['ingredients']!),
            SizedBox(height: 10),
            Text(
              'Instructions:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(recipeData['instructions']!),
          ],
        ),
      ),
    );
  }
}
