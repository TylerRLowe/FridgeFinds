import 'package:flutter/material.dart';
import 'RecipeCard.dart';
import 'dart:math';
import 'package:fridge_finds_final/Menu.dart';

class ExploreRecipes extends StatefulWidget {
  @override
  _ExploreRecipesState createState() => _ExploreRecipesState();
}

class _ExploreRecipesState extends State<ExploreRecipes> {
  final List<Map<String, String>> allRecipes = [
    {
      'name': 'Spaghetti Carbonara',
      'image': 'lib/image/spaghetti_carbonara.jpg',
      'description': 'A classic Italian pasta dish with eggs, cheese, pancetta, and pepper.',
      'ingredients': 'Pasta, Eggs, Pancetta, Parmesan, Black pepper',
      'instructions': 'Boil pasta, fry pancetta, mix with eggs and cheese.',
      'category': 'Italian'
    },
    {
      'name': 'Chicken Alfredo',
      'image': 'lib/image/chicken_alfredo.jpg',
      'description': 'Creamy pasta with grilled chicken and Alfredo sauce.',
      'ingredients': 'Pasta, Chicken breast, Cream, Parmesan, Garlic',
      'instructions': 'Cook pasta, grill chicken, prepare Alfredo sauce, mix.',
      'category': 'Chicken'
    },
    {
      'name': 'Vegetarian Tacos',
      'image': 'lib/image/vegetarian_tacos.jpg',
      'description': 'Delicious tacos made with a variety of vegetables.',
      'ingredients': 'Tortillas, Avocado, Lettuce, Tomato, Beans',
      'instructions': 'Fill tortillas with veggies, add toppings.',
      'category': 'Vegetarian'
    },
    {
      'name': 'Beef Stew',
      'image': 'lib/image/beef_stew.jpg',
      'description': 'A hearty stew made with beef, potatoes, and vegetables.',
      'ingredients': 'Beef, Potatoes, Carrots, Onion, Broth',
      'instructions': 'Cook beef, add vegetables, simmer until tender.',
      'category': 'Beef'
    },
    {
      'name': 'Chicken Curry',
      'image': 'lib/image/chicken_curry.jpg',
      'description': 'A flavorful chicken curry with spices and coconut milk.',
      'ingredients': 'Chicken, Coconut milk, Curry powder, Garlic, Ginger',
      'instructions': 'Cook chicken, add curry paste and coconut milk, simmer.',
      'category': 'Chicken'
    },
    {
      'name': 'Vegetable Stir-fry',
      'image': 'lib/image/veggie_stir_fry.jpg',
      'description': 'A quick stir-fry with a variety of vegetables.',
      'ingredients': 'Broccoli, Carrots, Bell peppers, Soy sauce, Garlic',
      'instructions': 'Stir-fry veggies in a pan with soy sauce.',
      'category': 'Vegetarian'
    },
  ];

  List<Map<String, String>> filteredRecipes = [];
  String selectedFilter = 'All';

  void filterRecipes(String query) {
    setState(() {
      filteredRecipes = allRecipes
          .where((recipe) =>
      (selectedFilter == 'All' || recipe['category'] == selectedFilter) &&
          recipe['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            SizedBox(width: 10),
            Text('Explore Recipes'),
          ],
        ),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search for a recipe',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  filterRecipes(value);
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedFilter,
                icon: Icon(Icons.filter_list),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFilter = newValue!;
                  });
                  filterRecipes('');
                },
                items: <String>['All', 'Italian', 'Chicken', 'Vegetarian', 'Beef']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: filteredRecipes.length,
                  itemBuilder: (context, index) {
                    Map<String, String> recipe = filteredRecipes[index];
                    int rating = Random().nextInt(6);
                    return Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            recipe['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeCard(recipeData: recipe),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  recipe['name']!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < rating ? Colors.yellow : Colors.grey,
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
