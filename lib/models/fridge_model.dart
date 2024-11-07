class FridgeModel {
  Set<int> listOfIngredients = {};
  Set<int> listOfNeededIngredients = {};
  FridgeModel();
  FridgeModel.fromJson(Map<String, dynamic> json) {
    listOfIngredients = Set<int>.from(json['list_of_ingredients'] ?? []);
    listOfNeededIngredients = Set<int>.from(json['list_of_needed_ingredients'] ?? []);
  }
}