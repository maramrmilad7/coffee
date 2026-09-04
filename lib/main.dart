import 'package:demoo/screens/homesreen.dart';
import 'package:demoo/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      title: 'McDonald',
      debugShowCheckedModeBanner: false,
    );
  }
}
