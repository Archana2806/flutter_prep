import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'recipe_detail.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;

  RecipeListScreen({required this.category});

  final List<RecipeModel> recipes = [
    RecipeModel(
      title: "Pancakes",
      category: "Breakfast",
      imagePath: "assets/pancakes.jpg",
      ingredients: ["Flour", "Milk", "Eggs", "Sugar"],
      steps: ["Mix ingredients", "Heat pan", "Pour batter", "Flip and serve"],
    ),
    RecipeModel(
      title: "Pasta",
      category: "Lunch",
      imagePath: "assets/pasta.jpg",
      ingredients: ["Pasta", "Tomato Sauce", "Cheese", "Garlic"],
      steps: ["Boil pasta", "Prepare sauce", "Combine", "Serve with cheese"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> filteredRecipes = recipes.where((r) => r.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text("$category Recipes")),
      body: ListView.builder(
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(filteredRecipes[index].imagePath, width: 50, height: 50),
            title: Text(filteredRecipes[index].title),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipe: filteredRecipes[index])),
            ),
          );
        },
      ),
    );
  }
}