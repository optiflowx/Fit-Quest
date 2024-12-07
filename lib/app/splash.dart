import 'dart:async';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:fit_quest/app/routes/app_routes.dart';
import 'package:fit_quest/core/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authRepository = AuthenticationRepository();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final user = await _authRepository.getCurrentUser();

    Timer(const Duration(seconds: 5), () {
      if (user != null) {
        context.replace(AppRoutes.home);
      } else {
        context.replace(AppRoutes.authSignUp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/gogeta.jpeg',
            fit: BoxFit.cover,
          ),
          // Icon overlay at the top
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/fitQuest.png', // Replace with your icon path
                width: 350, // Resize width
                height: 350, // Resize height
              ),
            ),
          ),
        ],
      ),
    );
  }
}
