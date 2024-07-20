import 'package:flutter/material.dart';
import 'landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This will hide the debug banner
      title: 'TimeMinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent, // Set scaffold background to transparent
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent, // Set Scaffold background to transparent
        body: Stack(
          children: [
            // Background gradient container
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlue[100]!,
                    Colors.lightBlue[200]!,
                    Colors.lightBlue[300]!,
                  ],
                ),
              ),
            ),
            // Your LandingPage as the foreground content
            LandingPage(),
          ],
        ),
      ),
    );
  }
}
