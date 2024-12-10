import 'package:flutter/material.dart';
import 'add_new.dart';
import 'package:fridge_finds_final/Menu.dart';

List<Map<String, dynamic>> shoppingList = [];

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
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
              onPressed: () async {
                final newRecipe = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewPage()),
                );

                if (newRecipe != null) {
                  setState(() {
                    shoppingList.add({
                      'recipeName': newRecipe['recipeName'],
                      'ingredient': newRecipe['ingredient'],
                      'checked': false,
                    });
                  });
                }
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
                    value: item['checked'],
                    onChanged: (bool? value) {
                      setState(() {
                        shoppingList[index]['checked'] = value ?? false;
                      });
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
                      setState(() {
                        shoppingList.removeAt(index);
                      });
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
