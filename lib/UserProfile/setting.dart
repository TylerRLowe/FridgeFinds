import 'package:flutter/material.dart';
import 'package:fridge_finds_final/signup_login_page/signup_or_login.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _name = 'None';
  String _isDarkTheme = 'dark';
  String _language = 'English';

  String _email = 'Name@example.com';
  String _phone = '+123456789';
  String _password = '********';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SettingsOption(
            title: 'Change Name',
            icon: Icons.person,
            onTap: () => _showChangeNameDialog(),
          ),
          SettingsOption(
            title: 'Theme',
            icon: Icons.brightness_6,
            onTap: () => _toggleTheme(),
          ),
          SettingsOption(
            title: 'Language',
            icon: Icons.language,
            onTap: () => _showLanguageDialog(),
          ),
          SettingsOption(
            title: 'Subscription',
            icon: Icons.subscriptions,
            onTap: () => _showSubscriptionDialog(),
          ),
          SettingsOption(
            title: 'Change Email',
            icon: Icons.email,
            onTap: () => _showChangeEmailDialog(),
          ),
          SettingsOption(
            title: 'Change Phone Number',
            icon: Icons.phone,
            onTap: () => _showChangePhoneDialog(),
          ),
          SettingsOption(
            title: 'Change Password',
            icon: Icons.lock,
            onTap: () => _showChangePasswordDialog(),
          ),
          SettingsOption(
            title: 'Log Out',
            icon: Icons.logout,
            onTap: () => _showLogoutDialog(),
          ),
        ],
      ),
    );
  }

  void _showChangeNameDialog() {
    TextEditingController nameController = TextEditingController(text: _name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Name'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Enter your name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _name = nameController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _toggleTheme() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Light', 'Dark', 'Gray', 'Green'].map((lang) {
            return RadioListTile(
              title: Text(lang),
              value: lang,
              groupValue: _language,
              onChanged: (value) {
                setState(() {
                  _language = value.toString();
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['English', 'Spanish', 'French', 'Chinese'].map((lang) {
            return RadioListTile(
              title: Text(lang),
              value: lang,
              groupValue: _language,
              onChanged: (value) {
                setState(() {
                  _language = value.toString();
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showSubscriptionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Subscription Details'),
        content: Text('Current Subscription: Premium Plan'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showChangeEmailDialog() {
    TextEditingController emailController = TextEditingController(text: _email);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Email'),
        content: TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Enter new email'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _email = emailController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showChangePhoneDialog() {
    TextEditingController phoneController = TextEditingController(text: _phone);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Phone Number'),
        content: TextField(
          controller: phoneController,
          decoration: InputDecoration(labelText: 'Enter new phone number'),
          keyboardType: TextInputType.phone,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _phone = phoneController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog() {
    TextEditingController passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Enter new password'),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _password = passwordController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Log Out'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignupOrLogin()),
              );
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SettingsOption({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
