import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeMinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
