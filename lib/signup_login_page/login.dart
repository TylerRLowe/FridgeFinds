import 'package:flutter/material.dart';
import '../Home_Page/HomePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign in with',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.red),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.black),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.computer, color: Colors.grey),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
