// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   _navigateToLanding() async {
//       await Future.delayed(const Duration(milliseconds: 3500), () {});
//       print("Done");
//       Navigator.push(context, PageRouteBuilder(
//         pageBuilder: (context, animation1, animation2) => const Landing(),
//         transitionDuration: const Duration(milliseconds: 500),
//         reverseTransitionDuration: Duration.zero,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: child,
//                   );},
//         ));
      
//     }
//   @override
//     void initState() {
//       super.initState();
//       _navigateToLanding();
//     }
//   @override
//   Widget build(BuildContext context) {
     
    

   
//     return Scaffold(

//       body: Center(
//         child: Stack(
//           children: [
//             ColorFiltered(
//               colorFilter: const ColorFilter.mode(
//                 Color.fromRGBO(168, 234, 238,0.8), // Set your desired color and opacity
//                 BlendMode.srcATop,            // Choose a blend mode (srcATop is commonly used)
//               ),
//               child: Image.asset("assets/2465f2c05e7b80b5e4c6b354583f0daf.jpeg", height: 1000, fit: BoxFit.cover,), // Path to your image
//             ),
//             Center(child: Image.asset("assets/icons/MerchantEyes icons-02-fotor-20240312133817.png", width: 250, height: 1000,))
//           ],
//         ),
//       ),
//     );
//   }
// }