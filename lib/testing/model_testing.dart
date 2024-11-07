import 'package:flutter_test/flutter_test.dart';
import '../view_models/user_view_model.dart';
import '../view_models/recipe_list_view_model.dart';
import '../view_models/recipe_view_model.dart';
import '../view_models/fridge_view_model.dart';
import '../view_models/ingredient_view_model.dart';
import '../models/user_model.dart';
import '../models/recipe_list_model.dart';
import '../models/recipe_model.dart';
import '../models/fridge_model.dart';
import '../models/ingredient_model.dart';

void main() {
  group('UserViewModel Tests', () {
    late UserViewModel userViewModel;

    setUp(() {
      userViewModel = UserViewModel(UserModel(
      ));
      userViewModel.setPassword('password');
      userViewModel.setUsername("username");
      userViewModel.addPreference('vegan');
      userViewModel.updateSetting("theme", "dark");
    });

    test('Validate only password with correct userId and password', () {
      expect(userViewModel.getUsername(),"username");
      expect(userViewModel.validatePassword('username', 'password'), isTrue);
      expect(userViewModel.validatePassword('usernam', 'password'), isFalse);
      expect(userViewModel.validatePassword('username', 'passwor'), isFalse);

    });

    test('passwords must be appropriate length', () {
      expect(userViewModel.setPassword("A"), isNot(""));

    });

    test('username must be unique', () {
      expect(userViewModel.setUsername("username"), isNot(""));

    });


    test('Update user preference', () {
      expect(userViewModel.getSetting('theme'), 'dark');
      userViewModel.updateSetting('theme', 'light');
      expect(userViewModel.getPreferences(), ['vegan']);
      expect(userViewModel.getSetting('theme'), 'light');
    });
  });

  group('RecipeListViewModel Tests', () {
    late RecipeListViewModel recipeListViewModel;
    RecipeViewModel recipe;

    setUp(() {
      recipe = RecipeViewModel();
      recipe.createNewRecipe("blah", "a.com/pasta.jpg", ["pasta"], {"protien" : 50});
      recipeListViewModel = RecipeListViewModel(recipe);
    });
    test('add to available recipe', (){
      recipeListViewModel.addToAvailable(0);
      expect(recipeListViewModel.getAvailable(), contains(0));
    });

    test('add recipe to favorites', () {
      recipeListViewModel.addToAvailable(0);
      recipeListViewModel.addFavorite(0);
      expect(recipeListViewModel.getFavorites(), contains(0));
    });



  });


  group('RecipeViewModel Tests', () {
    late RecipeViewModel recipeViewModel;

    setUp(() {
      recipeViewModel = RecipeViewModel();
      recipeViewModel.createNewRecipe("blah", "a.com/pasta.jpg", ["pasta"], {"cal" : 300});
    });

    test('get recipe image', () {
      expect(recipeViewModel.getRecipeImg(0), 'a.com/pasta.jpg');
    });

    test('get nutrition facts', () {
      expect(recipeViewModel.getNutritionFacts(0)?['cal'], 300);
    });
  });

  group('FridgeViewModel test ', () {
    late FridgeViewModel fridgeViewModel;

    setUp(() {
      fridgeViewModel = FridgeViewModel();
    });

    test('add ingredient to fridge', () {
      fridgeViewModel.addIngredientHave(0);
      expect(fridgeViewModel.getListHave(), contains(0));
    });

    test('remove ingredient from the fridge', () {
      fridgeViewModel.removeIngredientHave(1);
      expect(fridgeViewModel.getListHave(), isNot(contains('meat')));
    });

    test('add ingredient to list', () {
      fridgeViewModel.addIngredientNeed(0);
      expect(fridgeViewModel.getListNeed(), contains(0));
    });

    test('remove ingredient from the list', () {
      fridgeViewModel.removeIngredientNeed(1);
      expect(fridgeViewModel.getListNeed(), isNot(contains(1)));
    });
  });

  group('ingredientViewModel Tests', () {
    late IngredientViewModel ingredientViewModel;

    setUp(() {
      ingredientViewModel = IngredientViewModel();
      ingredientViewModel.addIngredient(null,null,null);
      // ingredientViewModel.updateQuantity(0, 1.5);
      // ingredientViewModel.updateNutrition(0,{'protien' : 50});
      // ingredientViewModel.updateExpiry(0,DateTime.now().add(const Duration(days: 5)));
    });

    test('Update ingredient quantity', () {
      ingredientViewModel.updateQuantity(0, 2.0);
      expect(ingredientViewModel.getQuantity(0), 2.0);
    });

  });
}
