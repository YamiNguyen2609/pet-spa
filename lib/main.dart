import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/root_container.dart';
import 'package:pet_spa/src/theme/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeMode _themeMode = ThemeMode.light;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        home: const RootContainer());
  }
}
