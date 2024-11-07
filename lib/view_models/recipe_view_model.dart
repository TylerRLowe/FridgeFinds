import 'package:flutter/cupertino.dart';
import 'package:fridge_finds_final/view_models/user_view_model.dart';
import '../models/recipe_model.dart';

int recipeGlobalId = 0;
class RecipeViewModel extends ChangeNotifier {
  final List<RecipeModel> _recipes = [];
  RecipeViewModel();
  ///input: the id of the recipe
  ///return: the image url for a recipe
  String getRecipeImg(int id) {
    if (id < 0 || id > recipeGlobalId - 1 )return "";
    return _recipes[id].imageUrl;
  }
  ///input: the id of the recipe, the new image id
  ///return: weather the image exists
  bool updateRecipeImg(int id,String img){
    if (id < 0 || id > recipeGlobalId - 1 )return false;
    _recipes[id].imageUrl=img;
    return true;
  }
  ///input: the id of the recipe
  ///return: recipe text for a recipe
  String getRecipeText(int id) {
    if (id < 0 || id > recipeGlobalId - 1 )return "";

    return _recipes[id].recipeText;
  }
  ///input: the id of the recipe, the new recipe text
  ///return: weather the image exists
  bool updateRecipeText(int id,String txt){
    if (id < 0 || id > recipeGlobalId - 1 )return false;
    _recipes[id].recipeText=txt;
    return true;
  }
  ///input: the id of the recipe
  ///return: the nutrition facts for a recipe
  Map<String, dynamic>? getNutritionFacts(int id) {
    if (id < 0 || id > recipeGlobalId - 1 )return {};
    return _recipes[id].nutritionFacts;
  }

  ///input: the id of the recipe, the new image id
  ///return: the weather the image exists
  bool updateNutritionFacts(int id,Map<String,dynamic> nut){
    if (id < 0 || id > recipeGlobalId - 1 )return false;
    _recipes[id].nutritionFacts=nut;
    return true;
  }

  ///creates a new recipe
  /// all inputs are optional
  /// returns the id of the new recipe
  /// after creating a new recipe, we should add the id to all availabe recipes asap
  int createNewRecipe(String? recipeText,String? imageUrl,List<String>? ingredients, Map<String, dynamic>? nutritionFacts){
    recipeText ??= "";
    imageUrl ??= "";
    ingredients ??= [];
    nutritionFacts ??= {};
    RecipeModel recipe = RecipeModel(recipeId: recipeGlobalId,recipeText: recipeText,imageUrl: imageUrl, nutritionFacts: nutritionFacts);
    _recipes.add(recipe);
    recipeGlobalId++;
    return recipeGlobalId -1;

  }

  ///get recipe from arr
  ///input: recipe id
  ///return: recipe if it exits, else NULL
  RecipeModel? getRecipe(int id){
    if(0 < id || id > recipeGlobalId - 1){
      return null;
    }
    return _recipes[id];
  }


}