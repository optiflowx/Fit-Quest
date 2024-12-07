import 'package:fit_quest/app/error_page.dart';
import 'package:fit_quest/presentation/authentication/pages/sign_up_page.dart';
import 'package:fit_quest/app/splash.dart';
import 'package:fit_quest/presentation/home/home_screen.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_first.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_four.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_one.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_three.dart';
import 'package:fit_quest/presentation/onboarding/on_boarding_two.dart';
import 'package:fit_quest/presentation/onboarding/welcome_screen.dart';
import 'package:fit_quest/presentation/running_tracker/running_tracker.dart';
import '../presentation/authentication/pages/sign_in_page.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class FitQuestApp extends StatelessWidget {
  const FitQuestApp({super.key});

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
        AppRoutes.onboardingFirst: (context) => const OnBoardingFirst(),
        AppRoutes.onboardingOne: (context) => const OnBoardingOne(),
        AppRoutes.onboardingTwo: (context) => const OnBoardingTwo(),
        AppRoutes.onboardingThree: (context) => const OnBoardingThree(),
        AppRoutes.onboardingFour: (context) => const OnBoardingFour(),
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
