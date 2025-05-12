import 'package:flutter/material.dart';
import 'package:player/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(Icons.music_note,
                size: 48, color: Theme.of(context).textTheme.bodyLarge?.color),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).textTheme.bodyLarge?.color),
              title: Text('Home',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to home screen
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).textTheme.bodyLarge?.color),
              title: Text('Settings',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
