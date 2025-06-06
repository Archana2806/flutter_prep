import 'package:flutter/material.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "State Management Demo",
      home: CounterScreen(),
    );
  }
}