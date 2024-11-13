import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _isVerificationSent = false;
  bool _isCodeVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_isVerificationSent)
                TextField(
                  controller: _emailOrPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email or Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (!_isVerificationSent)
                const SizedBox(height: 20),

              if (_isVerificationSent && !_isCodeVerified)
                TextField(
                  controller: _verificationCodeController,
                  decoration: InputDecoration(
                    labelText: 'Enter Verification Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (_isVerificationSent && !_isCodeVerified)
                const SizedBox(height: 20),

              if (!_isVerificationSent)
                ElevatedButton(
                  onPressed: () {
                    String emailOrPhone = _emailOrPhoneController.text;
                    print('Send verification code to: $emailOrPhone');
                    setState(() {
                      _isVerificationSent = true;
                    });
                  },
                  child: Text('Send Verification Code'),
                ),

              if (_isVerificationSent && !_isCodeVerified)
                ElevatedButton(
                  onPressed: () {
                    String verificationCode = _verificationCodeController.text;
                    print('Verifying code: $verificationCode');
                    setState(() {
                      _isCodeVerified = true;
                    });
                  },
                  child: Text('Verify Code'),
                ),

              if (_isCodeVerified)
                const SizedBox(height: 20),

              if (_isCodeVerified)
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter New Password',
                    border: OutlineInputBorder(),
                  ),
                ),

              if (_isCodeVerified)
                ElevatedButton(
                  onPressed: () {
                    String newPassword = _newPasswordController.text;
                    print('New password: $newPassword');
                  },
                  child: Text('Reset Password'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
