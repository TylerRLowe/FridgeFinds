import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'forget_password.dart';
import 'package:fridge_finds_final/models/user_model.dart';
import '../view_models/user_view_model.dart';

class SignupOrLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = UserViewModel(UserModel());

    return Scaffold(
      appBar: AppBar(
        title: Text('FridgeFinds'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(userViewModel: userViewModel),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(userViewModel: userViewModel),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()),
                );
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
