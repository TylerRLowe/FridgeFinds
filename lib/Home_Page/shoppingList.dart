import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Center(
        child: Text('This is the shopping list page'),
      ),
    );
  }
}
