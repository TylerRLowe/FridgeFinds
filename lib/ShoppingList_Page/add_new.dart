import 'package:flutter/material.dart';

class add_new_list extends StatelessWidget {
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
      body: Center(
        child: Text('This is the Add New Shopping List page'),
      ),
    );
  }
}
