import 'package:flutter/material.dart';
import 'package:todo/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(97, 94, 255, 1),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const LandingScreen(name: 'Todo Application Home Page'),
    );
  }
}
