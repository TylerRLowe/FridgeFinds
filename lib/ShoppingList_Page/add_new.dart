import 'package:flutter/material.dart';
import '../view_models/recipe_list_view_model.dart';
import '../view_models/fridge_view_model.dart';
import '../view_models/recipe_view_model.dart';

class AddNewList extends StatelessWidget {
  final RecipeListViewModel recipeListViewModel;
  final FridgeViewModel fridgeViewModel = FridgeViewModel();

  AddNewList({required this.recipeListViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Shopping List'),
      ),
      body: ListView.builder(
        itemCount: recipeListViewModel.getAvailable().length,
        itemBuilder: (context, index) {
          final ingredientId = recipeListViewModel.getAvailable()[index];
          return CheckboxListTile(
            title: Text('Ingredient $ingredientId'),
            value: fridgeViewModel.getListNeed()?.contains(ingredientId) ?? false,
            onChanged: (bool? value) {
              if (value == true) {
                fridgeViewModel.addIngredientNeed(ingredientId);
              } else {
                fridgeViewModel.removeIngredientNeed(ingredientId);
              }
            },
          );
        },
      ),
    );
  }
}
