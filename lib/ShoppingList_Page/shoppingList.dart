import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';
import 'add_new.dart';
import 'edit_list.dart';
import 'package:fridge_finds_final/view_models/fridge_view_model.dart';
import 'package:fridge_finds_final/view_models/recipe_list_view_model.dart';
import 'package:fridge_finds_final/view_models/recipe_view_model.dart';

class ShoppingList extends StatelessWidget {
  final FridgeViewModel fridgeViewModel = FridgeViewModel();
  final RecipeListViewModel recipeListViewModel;

  // Updated constructor to accept a RecipeViewModel
  ShoppingList({Key? key}) :
        recipeListViewModel = RecipeListViewModel(RecipeViewModel()),
        super(key: key);

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
            Text('Shopping List'),
          ],
        ),
      ),
      drawer: Menu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewList(recipeListViewModel: recipeListViewModel)),
                );
              },
              child: Text(
                '+ Add new list',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fridgeViewModel.getListNeed()?.length ?? 0,
              itemBuilder: (context, index) {
                final ingredientId = fridgeViewModel.getListNeed()?[index] ?? 0;
                return ListTile(
                  title: Text('Ingredient $ingredientId'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditList(ingredientId: ingredientId, fridgeViewModel: fridgeViewModel)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
