import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            );
          },
        ),
      ),
    );
  }
}