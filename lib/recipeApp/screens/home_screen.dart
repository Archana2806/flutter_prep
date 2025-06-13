import 'package:flutter/material.dart';
import 'recipe_list.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Breakfast", "Lunch", "Dinner", "Dessert"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Categories")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeListScreen(category: categories[index])),
            ),
          );
        },
      ),
    );
  }
}