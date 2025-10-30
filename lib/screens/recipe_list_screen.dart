import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> _results = [];
  bool _loading = false;
  String? _error;

  void _search(String q) async {
    if (q.trim().isEmpty) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final res = await RecipeService().searchRecipes(q, number: 25);
      setState(() {
        _results = res;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: Column(children: [
          RecipeSearchBar(onChanged: (q) {
            // debounce not implemented for simplicity
            _search(q);
          }),
          Expanded(
            child: _loading
                ? Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(child: Text('Error: $_error'))
                : ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) => RecipeCard(recipe: _results[index]),
            ),
          ),
        ]));
  }
}
