import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../models/ingredient_model.dart';

int globalIngredientCount = 0;
class IngredientViewModel extends ChangeNotifier {
  final List<IngredientModel> _ingredient = [];

  IngredientViewModel();

  ///input: id of desired ingredient
  ///return: quantity remaining of ingreident, -1 if ingredient dne
  double getQuantity(int id) {
    if (0 < id || _ingredient.length <= id) return -1;
    return _ingredient[id].quantity;
  }

  ///input: id of desired ingredient
  ///return: nutrition of ingreident, {} if ingredient dne
  Map<String,dynamic> getNutrition(int id) {
    if (0 < id || _ingredient.length <= id) return {};
    return _ingredient[id].nutrition;
  }

  ///input: id of desired ingredient
  ///return: expiration date of ingreident, DateTime(0) if ingredient dne
  DateTime getExpiry(int id) {
    if (0 < id || _ingredient.length <= id) return DateTime(0);
    return _ingredient[id].expiryDate;
  }


  ///function to add new ingredient
  ///input: expiry, quantity, nutrion
  ///returns the id of the ingredient
  ///this should immediatly be added to the fridge fter creation
  int addIngredient(DateTime? expiry, double? quantity,
      Map<String, dynamic>? nutrition) {
    expiry ??= DateTime(0);
    quantity ??= -1;
    nutrition ??= {};
    IngredientModel ingredient = IngredientModel();
    ingredient.id = globalIngredientCount;
    globalIngredientCount += 1;
    ingredient.expiryDate = expiry;
    ingredient.quantity = quantity;
    ingredient.nutrition = nutrition;
    _ingredient.add(ingredient);
    return ingredient.id;
  }

  ///update an existing ingredient quantity
  ///input: id of ingredient, newQuantity
  void updateQuantity(int id, double newQuantity) {
    if (id >= 0 && id < _ingredient.length) {
        _ingredient[id].quantity = newQuantity;
        notifyListeners();
    }
  }

  ///update an existing ingredient nutrition
  ///input: id of ingredient, nutrition
  void updateNutrition(int id, Map<String,dynamic> nutrition) {
    if (id >= 0 && id < _ingredient.length) {
      _ingredient[id].nutrition = nutrition;
      notifyListeners();
    }
  }

  ///update an existing ingredient expirtation date
  ///input: id of ingredient, datatime expiration data
  void updateExpiry(int id, DateTime expiry) {
    if (id >= 0 && id < _ingredient.length) {
      _ingredient[id].expiryDate = expiry;
      notifyListeners();
    }
  }
}
