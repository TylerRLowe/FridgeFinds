import 'dart:ffi';

import 'package:fridge_finds_final/models/recipe_model.dart';

class RecipeListModel {
  Set<int> allAvailable = {};
  Set<int>recommended = {};
  Set<int> cookedBefore = {};
  Set<int> favorites = {};
  RecipeListModel();
  RecipeListModel.fromJson(Map<String, dynamic> json) {
    favorites = Set<int>.from(json['favorites'] ?? {});
    recommended = Set<int>.from(json['recommended'] ?? {});
    cookedBefore = Set<int>.from(json['cooked_before'] ?? {});
    allAvailable = Set<int>.from(json['all_available'] ?? {});
  }
}