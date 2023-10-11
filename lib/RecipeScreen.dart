import 'package:flutter/material.dart';

import 'recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(recipe.photoUrl),
            Text('Назва: ${recipe.name}'),
            Text('Час приготування: ${recipe.cookingTime} хвилин'),
          ],
        ),
      ),
    );
  }
  void onRemoveButtonPressed() {
    // Remove the recipe from the list. You can call a function from RecipeListScreen to handle this.
  }
}