import 'dart:async';
import 'package:fit_quest/ui/dashboard/home_page.dart';
import 'package:fit_quest/ui/dashboard/navigation_bar.dart';
import 'package:fit_quest/ui/registering/sign_up.dart';
import 'package:fit_quest/ui/running_tracker/running_tracker.dart';
import 'package:fit_quest/ui/signing_in/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login screen after 8 seconds
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/gogeta.jpeg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Icon overlay at the top
          Positioned(
            top: 100, // Adjust top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/fitQuest.png', // Replace with your icon path
                width: 350, // Resize width
                height: 350, // Resize height
              ),
            ),
          ),
        ],
      ),
    );
  }
}
