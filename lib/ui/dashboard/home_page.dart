import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page-screen';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime currentDate;
  late DateTime previousDay;
  late DateTime nextDay1;
  late DateTime nextDay2;
  late DateTime nextDay3;

  int _currentIndex = 0; // Track the selected bottom navigation item

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    previousDay = currentDate.subtract(const Duration(days: 1));
    nextDay1 = currentDate.add(const Duration(days: 1));
    nextDay2 = currentDate.add(const Duration(days: 2));
    nextDay3 = currentDate.add(const Duration(days: 3)); // Add one more day
  }

  String formatDate(DateTime date) {
    return DateFormat('dd').format(date);
  }

  String formatDayLabel(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  // Method to build the BottomNavigationBar
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
          icon: Icon(Icons.leaderboard),
          label: 'Learderboard'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Dietry plan'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _currentIndex, // Set the current index dynamically
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update the current index when an item is tapped
        });
        switch (index) {
          case 0:
            // Already on home screen, no action needed
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Background color
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView to enable scrolling
        child: Padding(
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
              // Dynamic Date Cards with 5 cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Day Card
                  DayCard(
                    day: formatDate(previousDay),
                    label: formatDayLabel(previousDay),
                    backgroundColor: const Color(0xFF5E68E6),
                  ),
                  // Current Day Card
                  DayCard(
                    day: formatDate(currentDate),
                    label: formatDayLabel(currentDate),
                    backgroundColor: const Color(0xFFCD873C), // Current day color
                  ),
                  // Next Day 1 Card
                  DayCard(
                    day: formatDate(nextDay1),
                    label: formatDayLabel(nextDay1),
                    backgroundColor: const Color(0xFF5E68E6),
                  ),
                  // Next Day 2 Card
                  DayCard(
                    day: formatDate(nextDay2),
                    label: formatDayLabel(nextDay2),
                    backgroundColor: const Color(0xFF5E68E6),
                  ),
                  // Next Day 3 Card
                  DayCard(
                    day: formatDate(nextDay3),
                    label: formatDayLabel(nextDay3),
                    backgroundColor: const Color(0xFF5E68E6),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              
              // Plan Items Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF3E3E3E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Plan", style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        PlanCard(
                          title: "Workout",
                          duration: "2 hours",
                          color: Color(0xFF5E68E6),
                          icon: Icons.fitness_center,
                        ),
                        PlanCard(
                          title: "Meditate",
                          duration: "1 hour",
                          color: Color(0xFF5E68E6),
                          icon: Icons.self_improvement,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        PlanCard(
                          title: "Food",
                          duration: "1832 kcal",
                          color: Color(0xFF5E68E6),
                          icon: Icons.restaurant,
                        ),
                        ActionButtonCard(
                          title: "Let’s Go",
                          color: Color(0xFFB0B3B8),
                        ),
                      ],
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
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context), // Add bottom navigation here
    );
  }
}

// DayCard Widget for displaying the date and day inside a card
class DayCard extends StatelessWidget {
  final String day;
  final String label;
  final Color backgroundColor;

  const DayCard({super.key, 
    required this.day,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor, // Use dynamic background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the card
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              day,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(label, style: const TextStyle(color: Colors.white)),
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

  const PlanCard({super.key, 
    required this.title,
    required this.duration,
    required this.color,
    required this.icon,
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
    );
  }
}

// ActionButtonCard for the "Let’s Go" button
class ActionButtonCard extends StatelessWidget {
  final String title;
  final Color color;

  const ActionButtonCard({super.key, 
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
