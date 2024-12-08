import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fit_quest/app/app_palette.dart';

import '../../app/routes/app_routes.dart';
import '../../components/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.darkGrey,
      body: Column(
        children: [
          // Purple curved background with illustration
          SafeArea(
            child: Center(
              child: Image.asset(
                'assets/design/welcome.png',
                height: context.screenHeight * 0.5,
                width: context.screenWidth * 0.9,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: context.screenHeight * 0.4,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Welcome to FitQuest',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "You are all set now, let's reach your goals together with us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),

                // Next button
                SafeArea(
                  child: AppButton(
                    text: 'Go to Home',
                    onPressed: () => context.replace(AppRoutes.home),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
