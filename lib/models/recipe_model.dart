import 'package:fridge_finds_final/models/ingredient_model.dart';

class RecipeModel {
  int recipeId = -1;
  String recipeText = "";
  String imageUrl = "";
  List<IngredientModel> ingredients = [];
  Map<String, dynamic>? nutritionFacts;
  RecipeModel({
    this.recipeId = -1,
    this.recipeText = "",
    this.imageUrl = "",
    this.ingredients = const [],
    this.nutritionFacts,
  });
  RecipeModel.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
    recipeText = json['recipe'];
    imageUrl = json['image'];
    ingredients = List<IngredientModel>.from(json['ingredients'] ?? []);
    nutritionFacts = json['nutrition_facts'];
  }
}
