import 'package:flutter/material.dart';

class FacebookSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FacebookSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Trigger Facebook Sign-In
        try {
          // Add your Facebook authentication logic here
          // This example assumes a successful sign-in for simplicity.
          print('User signed in with Facebook');
          onPressed();
        } catch (error) {
          print('Facebook sign-in error: $error');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1877F2), // Facebook blue color
        foregroundColor: Colors.white, // Text and icon color
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      icon: Image.asset(
        'assets/facebook.png', // Path to the Facebook logo image
        height: 24,
        width: 24,
      ),
      label: const Text('Continue with Facebook'),
    );
  }
}
