import 'package:flutter/material.dart';
import 'main_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.pink], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/rbg.png', height: 150),
              SizedBox(height: 20),
              Text(
                'TimeMinder',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color for better contrast
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Effective Time Management\nfor Students',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Text color for better contrast
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  foregroundColor: Colors.black, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
