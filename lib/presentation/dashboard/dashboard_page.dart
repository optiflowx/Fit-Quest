import 'package:fit_quest/components/widgets/time_dialog_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EVERYDAY WE'RE MUSCLE'N",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Hello, Katlego 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            // Plan Items Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("My Plan",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      PlanCard(
                        title: "Workout",
                        duration: "2 hours",
                        color: const Color(0xFF5E68E6),
                        icon: Icons.fitness_center,
                        onTap: () {
                          Navigator.pushNamed(context, '/workout_page');
                        },
                      ),
                      PlanCard(
                        title: "Meditate",
                        duration: "1 hour",
                        color: const Color(0xFF5E68E6),
                        icon: Icons.self_improvement,
                        onTap: () {
                          // print("Meditation time!");
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => const TimerDialog(title: 'Meditation Timer'),
                          // );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      PlanCard(
                        title: "Food",
                        duration: "1832 kcal",
                        color: const Color(0xFF5E68E6),
                        icon: Icons.restaurant,
                        onTap: () {},
                      ),
                      const ActionButtonCard(
                        title: "Let’s Go",
                        color: Color(0xFFB0B3B8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text("Weekly Stats",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    "Most Active: Friday",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DayStat(day: "Mon", active: false),
                        DayStat(day: "Tue", active: false),
                        DayStat(day: "Wed", active: false),
                        DayStat(day: "Thu", active: false),
                        DayStat(day: "Fri", active: true),
                        DayStat(day: "Sat", active: false),
                        DayStat(day: "Sun", active: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PlanCard Widget for displaying individual plans inside a container
class PlanCard extends StatelessWidget {
  final String title;
  final String duration;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.duration,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => TimerDialog(title: title),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              duration,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// ActionButtonCard for the "Let’s Go" button
class ActionButtonCard extends StatelessWidget {
  final String title;
  final Color color;

  const ActionButtonCard({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// DayStat Widget for weekly activity stats
class DayStat extends StatelessWidget {
  final String day;
  final bool active;

  const DayStat({super.key, required this.day, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: const TextStyle(color: Colors.white)),
        Container(
          height: active ? 40 : 20,
          width: 10,
          color: active ? Colors.blue : Colors.grey,
        ),
      ],
    );
  }
}
