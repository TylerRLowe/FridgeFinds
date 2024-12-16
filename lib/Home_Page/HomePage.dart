import 'package:flutter/material.dart';
import 'package:fridge_finds_final/Menu.dart';
import '../ExploreRecipe/exploreRecipe.dart';
import '../Fridge/pantry.dart';

final List<Map<String, String>> recommendRecipes = [
  {
    'name': 'Spaghetti Carbonara',
    'image': 'lib/image/spaghetti_carbonara.jpg',
    'description': 'A classic Italian pasta dish with eggs, cheese, pancetta, and pepper.',
    'ingredients': 'Pasta, Eggs, Pancetta, Parmesan, Black pepper',
    'instructions': 'Boil pasta, fry pancetta, mix with eggs and cheese.',
    'category': 'Italian',
  },
  {
    'name': 'Chicken Alfredo',
    'image': 'lib/image/chicken_alfredo.jpg',
    'description': 'Creamy pasta with grilled chicken and Alfredo sauce.',
    'ingredients': 'Pasta, Chicken breast, Cream, Parmesan, Garlic',
    'instructions': 'Cook pasta, grill chicken, prepare Alfredo sauce, mix.',
    'category': 'Chicken',
  },
  {
    'name': 'Vegetarian Tacos',
    'image': 'lib/image/vegetarian_tacos.jpg',
    'description': 'Delicious tacos made with a variety of vegetables.',
    'ingredients': 'Tortillas, Avocado, Lettuce, Tomato, Beans',
    'instructions': 'Fill tortillas with veggies, add toppings.',
    'category': 'Vegetarian',
  },
];

class HomePage extends StatelessWidget {
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
            Text('Home Page'),
          ],
        ),
      ),
      drawer: Menu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have # expired ingredients!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pantry()),
                    );
                  },
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Recommended Recipes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Column(
                  children: recommendRecipes.map((recipe) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                recipe['image']!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipe['name']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    recipe['description']!,
                                    style: TextStyle(fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExploreRecipes()),
                      );
                    },
                    child: Text('Explore Recipes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
