import 'package:fit_quest/app/error_page.dart';
import 'package:fit_quest/presentation/authentication/pages/sign_up_page.dart';
import 'package:fit_quest/app/splash.dart';
import 'package:fit_quest/presentation/home/home_screen.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_five.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_two.dart';
import 'package:fit_quest/presentation/onboarding/onboarding_one.dart';
import 'package:fit_quest/presentation/onboarding/welcome_screen.dart';
import 'package:fit_quest/presentation/running_tracker/running_tracker.dart';
import '../core/services/system_ui_service.dart';
import '../presentation/authentication/pages/sign_in_page.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../presentation/onboarding/on_boarding_four.dart';
import '../presentation/onboarding/on_boarding_three.dart';

class FitQuestApp extends StatefulWidget {
  const FitQuestApp({super.key});

  @override
  State<FitQuestApp> createState() => _FitQuestAppState();
}

class _FitQuestAppState extends State<FitQuestApp> {
  @override
  void initState() {
    super.initState();
    SystemUIService.initSystemUI();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF131313),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.authSignIn: (context) => const SignInPage(),
        AppRoutes.authSignUp: (context) => const SignUpPage(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.mapView: (context) => const CustomMapView(),
        AppRoutes.onboardingOne: (context) => const OnboardingOne(),
        AppRoutes.onboardingTwo: (context) => const OnboardingTwo(),
        AppRoutes.onboardingThree: (context) => const OnboardingThree(),
        AppRoutes.onboardingFour: (context) => const OnboardingFour(),
        AppRoutes.onboardingFive: (context) => const OnboardingFive(),
        AppRoutes.welcomeScreen: (context) => const WelcomeScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
      },
    );
  }
}
