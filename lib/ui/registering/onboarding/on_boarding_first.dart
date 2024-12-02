import 'package:flutter/material.dart';

class OnBoardingFirst extends StatefulWidget {
  static const routeName = '/OnboardingFirst-screen'; // Route name for navigation

  const OnBoardingFirst({super.key});

  @override
  OnBoardingFirstState createState() => OnBoardingFirstState(); // Correct state class name
}

class OnBoardingFirstState extends State<OnBoardingFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282A3C), // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6F57FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/design/bg1.png', // Path to your image
                      width: 150, // Adjust the size as needed
                      height: 150,
                      fit: BoxFit.contain, // Ensures the image fits within the dimensions
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Waffles are just pancakes with abs",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Our recipes and workouts are the perfect way to start your day. Sweat hard, then have a snack or drink. Whatever you prefer!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Action for the Next button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6F57FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
