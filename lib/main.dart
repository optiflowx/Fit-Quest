import 'dart:collection';

import 'package:fit_quest/splash.dart';
import 'package:fit_quest/ui/registering/onboarding/on_boarding_first.dart';
import 'package:fit_quest/ui/registering/onboarding/on_boarding_four.dart';
import 'package:fit_quest/ui/registering/onboarding/on_boarding_one.dart';
import 'package:fit_quest/ui/registering/onboarding/on_boarding_three.dart';
import 'package:fit_quest/ui/registering/onboarding/on_boarding_two.dart';
import 'package:fit_quest/ui/registering/onboarding/welcome_screen.dart';
import 'package:fit_quest/ui/running_tracker/running_tracker.dart';
import 'package:flutter/material.dart';
// import 'package:fit_quest/ui/registering/onboarding/on_boarding_one.dart';
import 'package:fit_quest/ui/dashboard/home_page.dart';
import 'package:fit_quest/ui/signing_in/sign_in.dart';
import 'package:fit_quest/ui/registering/sign_up.dart';

void main() {
  runApp(const FitQuestApp());
}

class FitQuestApp extends StatelessWidget {
  const FitQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login-screen': (context) => const LogIn(),
        '/sign_up': (context) => const SignUp(),
        '/home_page-screen': (context) => const HomePage(),
        '/mapview-screen': (context) => CustomMapView(),
        '/OnboardingFirst-screen': (context) => OnBoardingFirst(),
        '/OnboardingOne-screen': (context) => OnBoardingOne(),
        '/OnboardingTwo-screen': (context) => OnBoardingTwo(),
        '/OnboardingThree-screen': (context) => OnBoardingThree(),
        '/OnboardingFour-screen': (context) => OnBoardingFour(),
        '/WelcomeScreen-screen': (context) => WelcomeScreen(name: 'Katlego',),
      },
      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Text(
          'Oops! The page you are looking for doesn\'t exist.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
