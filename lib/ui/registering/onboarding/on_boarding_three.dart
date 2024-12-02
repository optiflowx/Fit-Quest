import 'package:flutter/material.dart';

class OnBoardingThree extends StatefulWidget {
  static const routeName = '/OnBoardingThree-screen'; // Route name for navigation

  const OnBoardingThree({super.key});

  @override
  OnBoardingThreeState createState() => OnBoardingThreeState(); // Correct state class name
}

class OnBoardingThreeState extends State<OnBoardingThree> {
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
                      'assets/design/bg2.png', // Path to your image
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
                    "Track Your Goal",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Don't worry if you have trouble determining your goals. We can help you determine your goals and track your progress.",
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
