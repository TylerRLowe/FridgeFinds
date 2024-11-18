import 'package:flutter/material.dart';

class Pantry extends StatefulWidget {
  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  List<String> pantryItems = [
    'Flour',
    'Sugar',
    'Rice',
    'Olive Oil',
    'Salt',
    'Pepper',
  ];

  void _addPantryItem(String item) {
    setState(() {
      pantryItems.add(item);
    });
  }

  void _removePantryItem(int index) {
    setState(() {
      pantryItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: pantryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pantryItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removePantryItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController itemController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Pantry Item'),
          content: TextField(
            controller: itemController,
            decoration: InputDecoration(
              labelText: 'Enter item name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String item = itemController.text;
                if (item.isNotEmpty) {
                  _addPantryItem(item);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
