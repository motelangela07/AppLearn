import 'package:flutter/material.dart';
import 'package:time_minder/key_concepts_and_tips.dart';
import 'educational_clip_screen.dart'; // Ensure this import is present
import 'productivity_techniques_screen.dart'; // Ensure this import is present
import 'productivity_tools_screen.dart'; // Ensure this import is present

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Text(
              'TimeMinder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Key Concepts and Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KeyConceptAndTips()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Productivity Tools'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductivityToolsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Productivity Techniques'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductivityTechniquesScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.play_circle_filled),
            title: Text('Educational Clip'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EducationalClipScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
