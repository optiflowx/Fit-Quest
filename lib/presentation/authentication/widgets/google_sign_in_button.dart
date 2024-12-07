import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: () async {
          // Trigger Google Sign-In
          try {
            GoogleSignIn googleSignIn = GoogleSignIn(
              scopes: ['email', 'profile'],
            );

            GoogleSignInAccount? account = await googleSignIn.signIn();
            if (account != null) {
              // Sign-in successful
              print('User signed in: ${account.displayName}');
              onPressed();
            } else {
              // Sign-in was aborted
              print('Google sign-in aborted');
            }
          } catch (error) {
            print('Google sign-in error: $error');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        icon: Image.asset('assets/Google.png', height: 40, width: 40),
        label: const Text('Continue with Google'),
      ),
    );
  }
}
