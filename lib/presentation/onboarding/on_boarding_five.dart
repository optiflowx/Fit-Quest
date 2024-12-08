import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fit_quest/app/app_palette.dart';

import '../../app/routes/app_routes.dart';
import '../../components/app_button.dart';

class OnboardingFive extends StatelessWidget {
  const OnboardingFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.accentBlue,
      body: Column(
        children: [
          // Purple curved background with illustration
          Center(
            child: Image.asset(
              'assets/design/bg5.png',
              height: context.screenHeight * 0.6,
              fit: BoxFit.fitHeight,
            ),
          ),

          // Content section
          Container(
            height: context.screenHeight * 0.4,
            color: AppPalette.darkGrey,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Improve Sleep Quality',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning.",
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
                    text: 'Next',
                    onPressed: () {
                      context.replace(AppRoutes.welcomeScreen);
                    },
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
