import 'package:flutter/material.dart';
import 'dart:async'; // Import dart:async for Timer
import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Create a repeating animation
    
    _animation = Tween<double>(begin: 0, end: -20).animate(_animationController!);

    _navigateToLandingPage();
  }

  Future<void> _navigateToLandingPage() async {
    await Future.delayed(Duration(seconds: 5)); // Show splash screen for 5 seconds
    _animationController?.stop(); // Stop the animation when navigating away
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }

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
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: Image.asset('assets/rbg.png', height: 150), // Splash image
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
