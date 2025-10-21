import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/theme.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';

void main() {
  runApp(
    // Favorite ⚪️
    ChangeNotifierProvider(
      create: (_) => FavoriteState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
