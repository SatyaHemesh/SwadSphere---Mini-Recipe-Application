import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final String hint;

  RecipeSearchBar({required this.onChanged, this.hint = 'Search recipes...'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
