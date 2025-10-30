import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: recipe.image != null
              ? Image.network(
            recipe.image!,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 70,
              height: 70,
              color: Colors.grey[200],
              child: Icon(Icons.fastfood),
            ),
          )
              : Container(
            width: 70,
            height: 70,
            color: Colors.grey[200],
            child: Icon(Icons.fastfood),
          ),
        ),
        title: Text(recipe.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RecipeDetailScreen(recipeId: recipe.id)),
          );
        },
      ),
    );
  }
}
