import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';
import '../config/api_config.dart';

class RecipeService {
  /// Search recipes by query (used for categories or search)
  Future<List<Recipe>> searchRecipes(String query, {int number = 15}) async {
    final url = ApiConfig.complexSearch(query: query, number: number);
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) {
      throw Exception('Failed to load recipes: ${resp.statusCode}');
    }
    final jsonData = json.decode(resp.body) as Map<String, dynamic>;
    final results = (jsonData['results'] as List).map((e) => Recipe.fromSearchJson(e)).toList();
    return results;
  }

  /// Get recipes by a category name. Spoonacular doesn't have categories like "Breakfast"
  /// by default, so you can map your category to search queries or cuisines.
  Future<List<Recipe>> getRecipesByCategory(String category, {int number = 15}) async {
    // Simple mapping: category => search term
    final query = category; // you can refine e.g., "Breakfast" -> "breakfast recipes"
    return searchRecipes(query, number: number);
  }

  /// Get detailed information for a recipe id
  Future<Recipe> getRecipeDetail(int id) async {
    final url = ApiConfig.recipeInformation(id);
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) {
      throw Exception('Failed to load recipe details: ${resp.statusCode}');
    }
    final jsonData = json.decode(resp.body) as Map<String, dynamic>;
    return Recipe.fromDetailJson(jsonData);
  }

  /// Specifically fetch Indian recipes using the new endpoint.
  Future<List<Recipe>> getIndianRecipes({int number = 15}) async {
    final url = ApiConfig.searchIndianRecipes(number: number);
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) {
      throw Exception('Failed to load Indian recipes: ${resp.statusCode}');
    }
    final jsonData = json.decode(resp.body) as Map<String, dynamic>;
    final results = (jsonData['results'] as List).map((e) => Recipe.fromSearchJson(e)).toList();
    return results;
  }
}
