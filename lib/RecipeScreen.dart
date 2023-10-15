import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

   RecipeScreen({required this.recipe});



//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
// class _RecipeListScreenState extends State<RecipeListScreen> {
//   List<Recipe> recipes = [
//     // Ваши рецепты
//   ];
//   bool isGridView = false; // Исходно отображать ListView
//
//   void toggleView() {
//     setState(() {
//       isGridView = !isGridView; // Переключение между ListView и GridView
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Список рецептів'),
//       ),
//       body: isGridView ? GridViewRecipes(recipes) : ListRecipes(recipes),
//       floatingActionButton: FloatingActionButton(
//         onPressed: toggleView,
//         child: Icon(isGridView ? Icons.list : Icons.grid_on),
//       ),
//     );
//   }
// }
//

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(recipe.name),
    ),
    body: Column(
      children: [
        Image.network(recipe.photoUrl),
        Text('Назва: ${recipe.name}'),
        Text('Час приготування: ${recipe.cookingTime} хвилин'),
      ],
    ),
  );
}
  void onRemoveButtonPressed() {
    // Remove the recipe from the list. You can call a function from RecipeListScreen to handle this.
  }
}