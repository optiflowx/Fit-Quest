import 'package:fit_quest/components/app_button.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Oops! The page you are looking for doesn\'t exist.',
              style: TextStyle(fontSize: 18),
            ),
            AppButton(
              onPressed: context.pop,
              text: 'Go Back',
            ),
          ],
        ),
      ),
    );
  }
}
