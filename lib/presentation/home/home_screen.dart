import 'package:fit_quest/presentation/dashboard/dashboard_page.dart';
import 'package:fit_quest/presentation/dietary/dietry_page.dart';
import 'package:fit_quest/presentation/exercise/exercise.dart';
import 'package:fit_quest/presentation/leaderboard/leaderboard.dart';
import 'package:fit_quest/presentation/settings/settings.dart';
import 'package:flutter/material.dart';

import '../onboarding/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  int _activeIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _activeIndex = index);
  }

  List<Map<String, dynamic>> bottomNavItems = [
    {
      'icon': Icons.home,
      'label': 'Dashboard',
      'view': const DashboardPage(),
    },
    {
      'icon': Icons.sports_gymnastics,
      'label': 'Exercises',
      'view': const ExercisePage(),
    },
    {
      'icon': Icons.leaderboard,
      'label': 'Leaderboard',
      'view': const LeaderboardPage(),
    },
    {
      'icon': Icons.fastfood,
      'label': 'Dietry Plan',
      'view': const DietryPage(),
    },
    {
      'icon': Icons.settings,
      'label': 'Settings',
      'view': const SettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavItems[_activeIndex]['view'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 180, 180, 180),
        selectedItemColor: const Color(0xFFCD873C),
        unselectedItemColor: const Color(0xFF353A40),
        items: bottomNavItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item['icon']),
            label: item['label'],
          );
        }).toList(),
      ),
    );
  }
}
