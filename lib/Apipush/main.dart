import 'package:flutter/material.dart';
import 'screens/add_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API POST Request",
      home: AddUserScreen(),
    );
  }
}