import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/journey.dart';
import 'screens/assessment.dart';

void main() {
  runApp(OfflineDrawerApp());
}

class OfflineDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Drawer App',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/journey': (context) => Journey(),
        '/assessment': (context) => Assessment(),
      },
    );
  }
}
