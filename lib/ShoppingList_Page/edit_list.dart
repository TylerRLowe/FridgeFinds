import 'package:flutter/material.dart';

class edit_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Edit Shopping List'),
          ],
        ),
      ),
      body: Center(
        child: Text('This is the shopping list page'),
      ),
    );
  }
}
