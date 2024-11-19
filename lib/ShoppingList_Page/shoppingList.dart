import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';
import 'add_new.dart';
import 'edit_list.dart';
import '../view_models/fridge_view_model.dart';
import '../view_models/recipe_list_view_model.dart';

List<Map<String, dynamic>> shoppingList = [];

class ShoppingList extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => AddNewPage()),
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
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                final item = shoppingList[index];
                return ListTile(
                  leading: Checkbox(
                    value: item['checked'] ?? false,
                    onChanged: (bool? value) {
                      shoppingList[index]['checked'] = value ?? false;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                  title: Text(
                    item['ingredient']!,
                    style: TextStyle(
                      decoration: (item['checked'] ?? false)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(item['recipeName']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      shoppingList.removeAt(index);
                      (context as Element).markNeedsBuild();
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