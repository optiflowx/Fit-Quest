import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingFirst extends StatelessWidget {
  const OnBoardingFirst({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A3C), // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
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
                      fit: BoxFit
                          .contain, // Ensures the image fits within the dimensions
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Waffles are just pancakes with abs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Our recipes and workouts are the perfect way to start your day. Sweat hard, then have a snack or drink. Whatever you prefer!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onPressed: () => context.push(AppRoutes.onboardingOne),
                    text: "Next",
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
