
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'favorites.dart';
import 'module_search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> modules = [];
  List<Map<String, dynamic>> filteredModules = [];
  List<Map<String, dynamic>> favorites = [];
  String searchQuery = "";

  void _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        String fileName = result.files.single.name;
        if (kIsWeb) {
          Uint8List fileBytes = result.files.single.bytes!;
          setState(() {
            modules.add({'name': fileName, 'bytes': fileBytes});
            _filterModules();
          });
        } else {
          String filePath = result.files.single.path!;
          setState(() {
            modules.add({'name': fileName, 'path': filePath});
            _filterModules();
          });
        }
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  void _filterModules() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredModules = List.from(modules);
      } else {
        filteredModules = modules
            .where((module) => module['name']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  void _addFavorite(Map<String, dynamic> module) {
    setState(() {
      if (!favorites.contains(module)) {
        favorites.add(module);
      }
    });
  }

  void _removeFavorite(Map<String, dynamic> module) {
    setState(() {
      favorites.remove(module);
    });
  }

  void _openFile(String path) {
    OpenFile.open(path);
  }

  void _openFileWeb(Uint8List bytes, String name) {
    print('Opening file on web: $name with length ${bytes.length}');
  }

  @override
  void initState() {
    super.initState();
    _filterModules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LearnApp'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ModuleSearchDelegate(
                  modules: modules,
                  onSelected: (module) {
                    setState(() {
                      searchQuery = module['name'];
                      _filterModules();
                    });
                  },
                  onOpenFile: kIsWeb
                      ? (module) =>
                          _openFileWeb(module['bytes'], module['name'])
                      : (module) => _openFile(module['path']),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _pickFile,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/landingPB.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'LearnApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Books & Documents'),
              onTap: () {
                Navigator.pop(context);
                _showModulesDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesPage(
                      favorites: favorites,
                      onRemoveFavorite: _removeFavorite,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('To Read'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Folder'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Trash'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add your educational modules by clicking the + button',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (filteredModules.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: filteredModules.length,
                  itemBuilder: (context, index) {
                    var module = filteredModules[index];
                    return ListTile(
                      title: Text(module['name']),
                      onTap: () => kIsWeb
                          ? _openFileWeb(module['bytes'], module['name'])
                          : _openFile(module['path']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite),
                            onPressed: () {
                              _addFavorite(module);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.alarm),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                modules.remove(module);
                                _filterModules();
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showModulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Books & Documents'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: filteredModules
                  .map((module) => ListTile(
                        title: Text(module['name']),
                        onTap: () => kIsWeb
                            ? _openFileWeb(module['bytes'], module['name'])
                            : _openFile(module['path']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {
                                _addFavorite(module);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.alarm),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  modules.remove(module);
                                  _filterModules();
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}



