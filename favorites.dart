
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:open_file/open_file.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;
  final Function(Map<String, dynamic>) onRemoveFavorite;

  FavoritesPage({required this.favorites, required this.onRemoveFavorite});

  void _openFile(BuildContext context, Map<String, dynamic> module) {
    if (kIsWeb) {
      // Handle file opening on the web if needed
      print(
          'Opening file on web: ${module['name']} with length ${module['bytes'].length}');
    } else {
      print('Opening file: ${module['path']}');
      OpenFile.open(module['path']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.lightBlue,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                var module = favorites[index];
                return ListTile(
                  title: Text(module['name']),
                  onTap: () => _openFile(context, module),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Remove the item from favorites immediately
                      onRemoveFavorite(module);

                      // Show a snackbar for confirmation and undo option
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${module['name']} removed from favorites.'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Implement undo logic if needed
                              // For now, just add it back to favorites
                              onRemoveFavorite(module); // Add it back
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}