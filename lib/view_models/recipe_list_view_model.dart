import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import '../models/recipe_list_model.dart';
import '../models/recipe_model.dart';
import 'recipe_view_model.dart';

class RecipeListViewModel extends ChangeNotifier {
  RecipeViewModel _recipeList = RecipeViewModel();
  final RecipeListModel _recipeLists = RecipeListModel();

  ///initiate with the existing recipe view model
  ///so initiate the recipe view, then pass that into the recipe list view
  ///this allows them to share info
  RecipeListViewModel(RecipeViewModel recipe) {
    _recipeList = recipe;
  }

  List<int> getFavorites(){
    return _recipeLists.favorites.toList();
  }
  ///input: id of recipe you want to favorite
  void addFavorite(int recipeId) {
    if(_recipeLists.allAvailable.contains((recipeId))){
    _recipeLists.favorites.add(recipeId);
    notifyListeners();}
  }

  List<int> getRecommended() {
    return _recipeLists.recommended.toList();
  }

  ///return: a list of all available recipie ids
  ///something like this can be used to get the full recipies, extract the min info
  ///needed
  ///    List<RecipeModel> recipes = [];
  ///     for(int id in _recipeLists.allAvailable){
  ///       recipes.add(_recipeList.getRecipe(id)!);
  ///     }
  List<int> getAvailable() {
    return  _recipeLists.allAvailable.toList();
  }

  ///remove recipe from everything except cookeded before
  ///input: the id of the recipe you want to remove,
  ///return: weather it was sucsessfull
  bool removeRecipeAvailable(int id){
    if(_recipeLists.allAvailable.contains(id)){
      _recipeLists.allAvailable.remove(id);
      removeRecipeFavorite(id);
      removeRecipeRecomended(id);
      return true;
    }
    return false;
  }

  ///removes a recipe from favorites
  ///input: the id of the recipe you want to remove,
  ///return: weather it was sucsessfull
  bool removeRecipeFavorite(int id){
    if(_recipeLists.favorites.contains(id)){
      _recipeLists.favorites.remove(id);
      return true;
    }
    return false;
  }

  ///removes recipe from recomended
  ///input: the id of the recipe you want to remove,
  ///return: weather it was sucsessfull
  bool removeRecipeRecomended(int id){
    if(_recipeLists.recommended.contains(id)){
      _recipeLists.recommended.remove(id);
      return true;
    }
    return false;
  }

  ///input: the id to add to the recipe list
  void addRecomended(int recipeId) {
    if(_recipeLists.allAvailable.contains((recipeId))){
      _recipeLists.recommended.add(recipeId);
      notifyListeners();}
  }

  ///input: the id to add to the recipe list
  void addCooked(int recipeId) {
    if(_recipeLists.allAvailable.contains((recipeId))){
      _recipeLists.cookedBefore.add(recipeId);
    notifyListeners();}
  }

  ///input: the id to add to the recipe list
  void addToAvailable(int id) {
    _recipeLists.allAvailable.add(id);
    notifyListeners();
  }

}