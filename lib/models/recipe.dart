// Simple model for Spoonacular basic search result + details.
class Recipe {
  final int id;
  final String title;
  final String? image; // may be null
  final List<String> ingredients; // from detailed endpoint
  final List<String> steps; // from detailed endpoint

  Recipe({
    required this.id,
    required this.title,
    this.image,
    this.ingredients = const [],
    this.steps = const [],
  });

  // Create from complexSearch 'results' item
  factory Recipe.fromSearchJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'],
    );
  }

  // Create from detailed /information endpoint
  factory Recipe.fromDetailJson(Map<String, dynamic> json) {
    // parse ingredients
    List<String> ingredients = [];
    if (json['extendedIngredients'] != null) {
      ingredients = (json['extendedIngredients'] as List)
          .map((e) => e['originalString'] ?? '${e['name'] ?? ''}')
          .cast<String>()
          .toList();
    }

    // parse steps
    List<String> steps = [];
    if (json['analyzedInstructions'] != null &&
        (json['analyzedInstructions'] as List).isNotEmpty) {
      final first = (json['analyzedInstructions'] as List).first;
      if (first['steps'] != null) {
        steps = (first['steps'] as List)
            .map((s) => s['step']?.toString() ?? '')
            .cast<String>()
            .toList();
      }
    } else if (json['instructions'] != null && json['instructions'] is String) {
      steps = [json['instructions']];
    }

    return Recipe(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'],
      ingredients: ingredients,
      steps: steps,
    );
  }
}
