import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/theme_provider.dart';
import 'package:test_project/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'News App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}