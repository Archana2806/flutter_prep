import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(recipe.imagePath, width: 200, height: 200),
            SizedBox(height: 10),
            Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...recipe.ingredients.map((i) => Text(i)).toList(),
            SizedBox(height: 10),
            Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...recipe.steps.map((s) => Text(s)).toList(),
          ],
        ),
      ),
    );
  }
}