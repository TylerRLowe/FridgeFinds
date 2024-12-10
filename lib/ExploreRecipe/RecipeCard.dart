import 'package:flutter/material.dart';
import '../SavedRecipes/SavedRecipes.dart';
import '../ShoppingList_Page/shoppingList.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, String> recipeData;

  RecipeCard({required this.recipeData});

  @override
  Widget build(BuildContext context) {
    List<String> ingredientsList = recipeData['ingredients']!.split(',');

    void _showPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Recipe Saved'),
            content: Text('Recipe has been added to Saved Recipes.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData['name']!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(recipeData['image']!),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    recipeData['name']!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _showPopup(context);
                      savedRecipes.add({
                        'recipeName': recipeData['name']!,
                      });
                    },
                    child: Text('Save Recipe'),
                  ),
                ],
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingredientsList.map((ingredient) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '- ${ingredient.trim()}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            shoppingList.add({
                              'recipeName': recipeData['name']!,
                              'ingredient': ingredient.trim(),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$ingredient added to shopping list!'),
                              ),
                            );
                          },
                          child: Text(
                            '+ Add to Shopping List',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(
                'Instructions:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(recipeData['instructions']!),
            ],
          ),
        ),
      ),
    );
  }
}
