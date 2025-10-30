import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final int recipeId;

  RecipeDetailScreen({required this.recipeId});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  Recipe? _recipe;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  void _loadDetail() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final r = await RecipeService().getRecipeDetail(widget.recipeId);
      setState(() {
        _recipe = r;
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

  Widget _buildBody() {
    if (_loading) return Center(child: CircularProgressIndicator());
    if (_error != null) return Center(child: Text('Error: $_error'));
    if (_recipe == null) return Center(child: Text('No details found'));

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_recipe!.image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(_recipe!.image!, width: double.infinity, height: 220, fit: BoxFit.cover),
          ),
        SizedBox(height: 12),
        Text(_recipe!.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        ..._recipe!.ingredients.map((i) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('• $i'),
        )),
        SizedBox(height: 12),
        Text('Steps', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        ..._recipe!.steps.map((s) => Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text('→ $s'),
        )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Recipe')), body: _buildBody());
  }
}
