class Ingredient {
  final int id;
  final String name;
  final double quantity;
  final Nutrition nutrition;
  final String expiryDate;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.nutrition,
    required this.expiryDate,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      nutrition: Nutrition.fromJson(json['nutrition']),
      expiryDate: json['expiry_date'],
    );
  }
}


class Nutrition {
  final double calories;
  final double carbs;
  final double protein;
  final double fat;

  Nutrition({
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'],
      carbs: json['carbs'],
      protein: json['protein'],
      fat: json['fat'],
    );
  }
}

class Recipe {
  final int recipeId;
  final String recipeText;
  final String image;
  final List<int> ingredientIds;
  final Nutrition nutritionFacts;

  Recipe({
    required this.recipeId,
    required this.recipeText,
    required this.image,
    required this.ingredientIds,
    required this.nutritionFacts,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipe_id'],
      recipeText: json['recipe_text'],
      image: json['image'],
      ingredientIds: List<int>.from(json['ingredients']),
      nutritionFacts: Nutrition.fromJson(json['nutrition_facts']),
    );
  }
}
