import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  // Added 'Indian' to the list of categories.
  final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Indian'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Recipe App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
          itemBuilder: (context, index) {
            final cat = categories[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoryScreen(category: cat)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    // Make sure you have an 'indian.jpg' in your assets/images folder.
                    image: AssetImage('assets/images/${cat.toLowerCase()}.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black26)],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
