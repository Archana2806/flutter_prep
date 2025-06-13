class RecipeModel {
  final String title;
  final String category;
  final String imagePath;
  final List<String> ingredients;
  final List<String> steps;

  RecipeModel({required this.title, required this.category, required this.imagePath, required this.ingredients, required this.steps});
}