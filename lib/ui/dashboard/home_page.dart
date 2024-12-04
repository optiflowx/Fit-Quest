import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page-screen';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Background color
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DayColumn(day: "25", label: "Wed"),
                DayColumn(day: "26", label: "Thu"),
                DayColumn(day: "29", label: "Sat"),
                DayColumn(day: "30", label: "Sun"),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("My Plan", style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 16),
                  const PlanItem(title: "Workout", duration: "2 hours", color: Colors.purple),
                  const PlanItem(title: "Meditate", duration: "1 hour", color: Colors.blue),
                  const PlanItem(title: "Food", duration: "1832 kcal", color: Colors.orange),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Let’s Go"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text("Weekly Stats", style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Most Active: Friday",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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

// DayColumn Widget for displaying date and day
class DayColumn extends StatelessWidget {
  final String day;
  final String label;

  const DayColumn({required this.day, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

// PlanItem Widget for displaying individual plans
class PlanItem extends StatelessWidget {
  final String title;
  final String duration;
  final Color color;

  const PlanItem({
    required this.title,
    required this.duration,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Text(duration, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

// DayStat Widget for weekly activity stats
class DayStat extends StatelessWidget {
  final String day;
  final bool active;

  const DayStat({required this.day, required this.active});

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

Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on home screen
            break;
          case 1:
            Navigator.pushNamed(context, '/exercise_tracking');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }