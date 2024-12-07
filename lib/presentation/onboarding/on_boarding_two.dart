import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

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
                      'assets/design/bg3.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
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
                  const Text(
                    "Get Burn",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Let's keep burning, to achieve your goals. It only hurts temporarily. If you give up now? You will be in pain forever.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onPressed: () => context.push(AppRoutes.onboardingThree),
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
