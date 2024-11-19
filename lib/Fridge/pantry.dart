import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fridge_finds_final/Menu.dart';

class PantryItem {
  String name;
  DateTime expirationDate;

  PantryItem({required this.name, required this.expirationDate});
}

class Pantry extends StatefulWidget {
  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  List<PantryItem> pantryItems = [
    PantryItem(name: 'Flour', expirationDate: DateTime(2024, 12, 30)),
    PantryItem(name: 'Sugar', expirationDate: DateTime(2025, 1, 15)),
    PantryItem(name: 'Rice', expirationDate: DateTime(2025, 5, 1)),
    PantryItem(name: 'Olive Oil', expirationDate: DateTime(2025, 8, 10)),
    PantryItem(name: 'Salt', expirationDate: DateTime(2026, 2, 20)),
    PantryItem(name: 'Pepper', expirationDate: DateTime(2026, 3, 5)),
  ];

  void _addPantryItem(String name, DateTime expirationDate) {
    setState(() {
      pantryItems.add(PantryItem(name: name, expirationDate: expirationDate));
    });
  }

  void _removePantryItem(int index) {
    setState(() {
      pantryItems.removeAt(index);
    });
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController itemController = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Pantry Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: itemController,
                decoration: InputDecoration(
                  labelText: 'Enter item name',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    selectedDate == null
                        ? 'Select expiration date'
                        : 'Expiration: ${DateFormat.yMd().format(selectedDate!)}',
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
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
                if (item.isNotEmpty && selectedDate != null) {
                  _addPantryItem(item, selectedDate!);
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
            Text('Expired Date'),
          ],
        ),
      ),
      drawer: Menu(),
      body: ListView.builder(
        itemCount: pantryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pantryItems[index].name),
            subtitle: Text('Expires on: ${DateFormat.yMd().format(pantryItems[index].expirationDate)}'),
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
}
