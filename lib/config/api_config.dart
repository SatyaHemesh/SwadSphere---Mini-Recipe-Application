const String spoonacularApiKey = '95f3bd281cd14f89bc1272d6dd0cf9f5';
class ApiConfig {
  static const String base = 'https://api.spoonacular.com';
  static String complexSearch({required String query, int number = 15}) =>
      '$base/recipes/complexSearch?query=$query&number=$number&apiKey=$spoonacularApiKey';
  static String searchByCuisine(String cuisine, {int number = 15}) =>
      '$base/recipes/complexSearch?cuisine=$cuisine&number=$number&apiKey=$spoonacularApiKey';

  static String searchIndianRecipes({int number = 15}) =>
      '$base/recipes/complexSearch?cuisine=Indian&number=$number&apiKey=$spoonacularApiKey';

  static String recipeInformation(int id) =>
      '$base/recipes/$id/information?includeNutrition=false&apiKey=$spoonacularApiKey';
}