import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final dynamic user;
  
  UserDetailScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user["name"])),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${user["email"]}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Phone: ${user["phone"]}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Company: ${user["company"]["name"]}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}