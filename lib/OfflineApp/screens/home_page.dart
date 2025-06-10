import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline App Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                Navigator.pushNamed(context, '/page1');
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                Navigator.pushNamed(context, '/page2');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the offline drawer app.\nUse the menu to navigate.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
