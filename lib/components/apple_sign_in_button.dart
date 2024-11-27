// import 'package:flutter/material.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class AppleSignInButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const AppleSignInButton({Key? key, required this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return ElevatedButton.icon(

//       onPressed: () async {
//         // Apple Sign-In logic
//         try {
//           final credential = await SignInWithApple.getAppleIDCredential(
//             scopes: [
//               AppleIDAuthorizationScopes.email,
//               AppleIDAuthorizationScopes.fullName,
//             ],
//           );
//           // On successful sign-in, you can access the credential
//           print('User signed in: ${credential.email}, ${credential.userIdentifier}');
//           onPressed();
//         } catch (error) {
//           print('Apple sign-in error: $error');
//         }
//       },

//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         minimumSize: const Size(double.infinity, 50),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: BorderSide(color: Colors.grey.shade300),
//         ),
//       ),
//       icon: Image.asset(
//         'assets/apple.png', // Path to the Apple logo image
//         height: 24,
//         width: 24,
//       ),
//       label: Text('Sign in with Apple'),
//     );
//   }
// }
