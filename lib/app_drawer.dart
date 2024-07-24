import 'package:flutter/material.dart';
import 'key_concepts_and_tips.dart';
import 'educational_clip_screen.dart';
import 'productivity_techniques_screen.dart';
import 'productivity_tools_screen.dart';
import 'timer_settings_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 96, 171, 233), // Blue color
                  Color.fromARGB(255, 233, 132, 166), // Pink color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the top of the row
              mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start of the row
              children: [
                Image.asset(
                  'assets/rbg.png', // Replace with the path to your image
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'TimeMinder',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
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
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Set Timer'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerSettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
