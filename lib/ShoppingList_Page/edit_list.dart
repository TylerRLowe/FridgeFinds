import 'package:flutter/material.dart';
import '../view_models/fridge_view_model.dart';

class EditList extends StatelessWidget {
  final int ingredientId;
  final FridgeViewModel fridgeViewModel;

  EditList({required this.ingredientId, required this.fridgeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ingredient'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Ingredient $ingredientId'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                fridgeViewModel.removeIngredientNeed(ingredientId);
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                fridgeViewModel.addIngredientNeed(ingredientId); // Add back the ingredient
                Navigator.pop(context);
              },
              child: Text('Add to Shopping List'),
            ),
          ),
        ],
      ),
    );
  }
}
