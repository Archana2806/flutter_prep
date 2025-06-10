import 'package:flutter/material.dart';

class Journey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'This is the Journey page. All this content is stored locally and works offline.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
