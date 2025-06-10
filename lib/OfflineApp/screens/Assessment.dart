import 'package:flutter/material.dart';

class Assessment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Welcome to the Assessment page.\nThis app requires zero internet. Static text, all the way.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
