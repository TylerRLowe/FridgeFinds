import 'package:flutter/cupertino.dart';
import '../models/fridge_model.dart';
import '../models/ingredient_model.dart';

class FridgeViewModel extends ChangeNotifier {
  final FridgeModel _fridge = FridgeModel();

  FridgeViewModel();

  ///adds an ingredient to the fridge
  ///input: id
  void addIngredientHave(int id) {
    _fridge.listOfIngredients.add(id);
    notifyListeners();
  }

  ///removes an ingredient from the fridge
  ///input: id
  void removeIngredientHave(int id){
    _fridge.listOfIngredients.remove(id);
    notifyListeners();
  }

  ///returns the ids of the ingredients currently in the fridge
  ///this can be dealt with in a similar way to recipe_list
  ///return: list of ingredient ids
  List<int>? getListHave() {
    return _fridge.listOfIngredients.toList();
  }

  ///adds an ingredient to the shopping list
  ///input: id
  void addIngredientNeed(int id) {
    _fridge.listOfNeededIngredients.add(id);
    notifyListeners();
  }

  ///removes an ingredient from the shopping list
  ///input: id
  void removeIngredientNeed(int id){
    _fridge.listOfNeededIngredients.remove(id);
    notifyListeners();
  }

  ///returns the ids of the ingredients currently in the shopping list
  ///this can be dealt with in a similar way to recipe_list
  ///return: list of ingredient ids
  List<int>? getListNeed() {
    return _fridge.listOfNeededIngredients.toList();
  }

}