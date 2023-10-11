import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipeScreen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe(
      photoUrl: 'https://cdn.lifehacker.ru/wp-content/uploads/2022/03/Kak-prigotovit-bliny-na-moloke-7-luchshih-receptov_1551448011_1647236304-1280x640.jpg',
      name: 'Блины',
      cookingTime: 30,
    ),
    Recipe(
      photoUrl: 'https://media.istockphoto.com/id/154226190/ru/фото/черный-currants.jpg?s=612x612&w=0&k=20&c=pPsuMDmKy1M1VKTY9_XyGt0KckGTwGVaSlLrJizoTOc=',
      name: 'Смородина',
      cookingTime: 45,
    ),// Додайте більше об'єктів Recipe за замовчуванням
  ];

  bool isGridView = false;

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептів'),
      ),
      body: isGridView
          ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipes[index]);
        },
      )
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            recipe: recipes[index],
            removeRecipe: () {
              // Удалите рецепт из списка.
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleView,
        child: Icon(isGridView ? Icons.list : Icons.grid_on),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback? removeRecipe;

  RecipeCard({ required this.recipe, this.removeRecipe});


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(recipe.name),
      onDismissed: (direction) {
        removeRecipe?.call(); // Вызываем колбэк, если он существует
      },

      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(recipe.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeScreen(recipe: recipe),
            ),
          );
        },
      ),
    );
  }
}
class ListRecipes extends StatelessWidget {
  final List<Recipe> recipes;

  const ListRecipes(this.recipes, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
    );
  }
}

class GridViewRecipes extends StatelessWidget {
  final List<Recipe> recipes;

  const GridViewRecipes(this.recipes, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Количество столбцов в сетке
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
    );
  }
}
