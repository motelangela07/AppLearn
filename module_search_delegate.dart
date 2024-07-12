
import 'package:flutter/material.dart';

class ModuleSearchDelegate extends SearchDelegate<Map<String, dynamic>> {
  final List<Map<String, dynamic>> modules;
  final Function(Map<String, dynamic>) onSelected;
  final Function(Map<String, dynamic>) onOpenFile;

  ModuleSearchDelegate({
    required this.modules,
    required this.onSelected,
    required this.onOpenFile,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Null as Map<String, dynamic>); // close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var module in modules) {
      if (module['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(module);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result['name']),
          onTap: () {
            onSelected(result);
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var module in modules) {
      if (module['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(module);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result['name']),
          onTap: () {
            onOpenFile(result);
          },
        );
      },
    );
  }
}