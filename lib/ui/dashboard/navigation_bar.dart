// import 'package:fit_quest/ui/dashboard/home_page.dart';
// import 'package:flutter/material.dart';

// class NavigationBar extends StatefulWidget {
//   static const routeName = '/navigationbar-screen';

//   const NavigationBar({super.key});

//   @override
//   _NavigationBarState createState() => _NavigationBarState();
// }

// class _NavigationBarState extends State<NavigationBar> {
//   int _selectedIndex = 0;

//   // List of pages to navigate
//   final List<Widget> _pages = [
//     HomePage(),
//     // FitnessPage(),
//     // DietryPage(),
//     // ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFF212121),
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Colors.blueGrey,
//         currentIndex: _selectedIndex, // Current selected index
//         onTap: _onItemTapped, // Handle icon tap
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fitness_center_sharp),
//             label: 'Fitness',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.food_bank_sharp),
//             label: 'Dietry',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
