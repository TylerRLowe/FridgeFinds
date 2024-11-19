import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Theme',
            icon: Icons.brightness_6,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Language',
            icon: Icons.language,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Subscription',
            icon: Icons.subscriptions,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Change Email',
            icon: Icons.email,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Change Phone Number',
            icon: Icons.phone,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Change Password',
            icon: Icons.lock,
            onTap: () {

            },
          ),
          SettingsOption(
            title: 'Log Out',
            icon: Icons.logout,
            onTap: () {

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Log Out'),
                  content: Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {

                        Navigator.pop(context);
                      },
                      child: Text('Log Out'),
                    ),
                  ],
                ),
              );
            },
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
