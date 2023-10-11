import 'package:flutter/material.dart';
import 'RecipeScreen.dart';
import 'recipe.dart'; // Імпортуйте ваш клас Recipe

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});


  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [

    Recipe(photoUrl: 'https://cdn.lifehacker.ru/wp-content/uploads/2022/03/Kak-prigotovit-bliny-na-moloke-7-luchshih-receptov_1551448011_1647236304-1280x640.jpg', name: 'Блины', cookingTime: 30,),

    Recipe(photoUrl: 'https://media.istockphoto.com/id/154226190/ru/фото/черный-currants.jpg?s=612x612&w=0&k=20&c=pPsuMDmKy1M1VKTY9_XyGt0KckGTwGVaSlLrJizoTOc=', name: 'Смородина', cookingTime: 45),
    // Додайте більше об'єктів Recipe за замовчуванням

  ];

  bool isGridView = false;

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
          return RecipeCard(recipe: recipes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isGridView = !isGridView;
          });ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                recipe: recipes[index],
                removeRecipe: () {

                },
              );
            },
          );
        },
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
