import 'package:flutter/material.dart';
import 'package:fridge_finds_final/view_models/fridge_view_model.dart';

class AddNewList extends StatefulWidget {
  final FridgeViewModel fridgeViewModel;

  AddNewList({Key? key, required this.fridgeViewModel}) : super(key: key);

  @override
  _AddNewListState createState() => _AddNewListState();
}

class _AddNewListState extends State<AddNewList> {
  final TextEditingController _ingredientController = TextEditingController();
  String _ingredientName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Add New Shopping List'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ingredientController,
              decoration: InputDecoration(
                labelText: 'Enter Ingredient',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _ingredientName = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ingredientName.isNotEmpty ? _addIngredient : null,
              child: Text('Add Ingredient'),
            ),
          ],
        ),
      ),
    );
  }

  void _addIngredient() {
    // Create a new ingredient object and add it to the fridge view model
    if (_ingredientName.isNotEmpty) {
      widget.fridgeViewModel.addIngredient(_ingredientName);

      // After adding the ingredient, navigate back to the shopping list
      Navigator.pop(context);
    }
  }
}
