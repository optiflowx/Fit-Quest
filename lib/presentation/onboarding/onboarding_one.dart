import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fit_quest/app/app_palette.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.accentBlue,
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.6,
            child: Image.asset(
              'assets/design/bg1.png',
              fit: BoxFit.fitHeight,
            ),
          ),

          // Content Section
          Container(
            height: context.screenHeight * 0.4,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppPalette.darkGrey,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Waffles are just\npancakes with abs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Our recipes and workouts are the perfect way to start your day. Sweat hard, then have a snack or drink. Whatever you prefer!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: AppButton(
                    text: 'Next',
                    backgroundColor: Colors.grey[900],
                    onPressed: () {
                      context.replace(AppRoutes.onboardingTwo);
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
