import 'package:flutter/material.dart';

class GitHubSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GitHubSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Trigger GitHub Sign-In
        try {
          // Add your GitHub authentication logic here
          // This example assumes a successful sign-in for simplicity.
          print('User signed in with GitHub');
          onPressed();
        } catch (error) {
          print('GitHub sign-in error: $error');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // GitHub branding color
        foregroundColor: Colors.white, // Text and icon color
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      icon: Image.asset(
        'assets/github.png', // Path to the GitHub logo image
        height: 24,
        width: 24,
      ),
      label: const Text('Continue with GitHub'),
    );
  }
}
