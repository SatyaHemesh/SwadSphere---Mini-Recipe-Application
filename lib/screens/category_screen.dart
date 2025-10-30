import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen({required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Recipe> _recipes = [];
  List<Recipe> _filtered = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      List<Recipe> results;
      // Check if the category is 'Indian' and call the appropriate service method.
      if (widget.category == 'Indian') {
        // Fetching the maximum number of recipes (100) for the 'Indian' category.
        results = await RecipeService().getIndianRecipes(number: 100);
      } else {
        results = await RecipeService().getRecipesByCategory(widget.category, number: 20);
      }
      setState(() {
        _recipes = results;
        _filtered = results;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _filter(String q) {
    setState(() {
      _filtered = _recipes.where((r) => r.title.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          RecipeSearchBar(onChanged: _filter, hint: 'Search ${widget.category} recipes...'),
          Expanded(
            child: _loading
                ? Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(child: Text('Error: $_error'))
                : _filtered.isEmpty
                ? Center(child: Text('No recipes found'))
                : ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, idx) => RecipeCard(recipe: _filtered[idx]),
            ),
          ),
        ],
      ),
    );
  }
}

