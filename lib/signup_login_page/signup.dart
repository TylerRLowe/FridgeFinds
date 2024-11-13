import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address*',
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
                labelText: 'Password*',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password*',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add signup functionality here
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            // Display "Sign up with" text
            const Text(
              'Sign up with',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Row of social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Icon
                IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.red), // Replace with actual Google icon
                  onPressed: () {
                    // Add Google sign-up functionality
                  },
                ),
                // Facebook Icon
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.black),
                  onPressed: () {
                    // Add Apple sign-up functionality
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
