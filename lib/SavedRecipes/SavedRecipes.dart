import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';
import '../view_models/fridge_view_model.dart';
import '../view_models/recipe_list_view_model.dart';

List<Map<String, dynamic>> savedRecipes = [];

class SavedRecipes extends StatefulWidget {
  @override
  _SavedRecipesState createState() => _SavedRecipesState();
}
class _SavedRecipesState extends State<SavedRecipes> {

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
            Text('Saved Recipes'),
          ],
        ),
      ),
      drawer: Menu(),
      body:
      Center(

          //Text('Your saved recipes will appear here.'),


            child: ListView.builder(
              itemCount: savedRecipes.length,
              itemBuilder: (context, index) {
                final item = savedRecipes[index];
                return ListTile(
                  // leading: Checkbox(
                  //   value: item['checked'] ?? false,
                  //   onChanged: (bool? value) {
                  //     savedRecipes[index]['checked'] = value ?? false;
                  //     (context as Element).markNeedsBuild();
                  //   },
                  // ),
                  title: Text(
                    item['recipeName'] ?? 'Unknown Recipe',
                  ),
                  //subtitle: Text(item['description']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        savedRecipes.removeAt(index);
                        //(context as Element).markNeedsBuild();
                      });
                    },
                  ),
                );
              },
            ),


      ),
    );
  }
}
