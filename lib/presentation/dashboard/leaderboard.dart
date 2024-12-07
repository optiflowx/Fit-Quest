import 'package:fit_quest/core/repository/leaderboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:fit_quest/core/models/user_data_model.dart'; // Import the UserAchievement model
// import 'package:your_app/services/leaderboard_service.dart'; // Import the service
// import 'package:your_app/models/user_achievement.dart'; // Import the data model

class LeaderboardPage extends StatefulWidget {
  static const routeName = '/leaderboard-screen';

  const LeaderboardPage({super.key});

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<LeaderboardPage> {
  late Future<List<UserAchievement>> _leaderboard;

  @override
  void initState() {
    super.initState();
    _leaderboard = LeaderboardRepository().getLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: const Color(0xFF91A5A7), // Match the color you want
      ),
      body: FutureBuilder<List<UserAchievement>>(
        future: _leaderboard,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No leaderboard data available.'));
          } else {
            List<UserAchievement> leaderboard = snapshot.data!;

            return ListView.builder(
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                UserAchievement user = leaderboard[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text('Points: ${user.points}'),
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()), // Ranking number
                  ),
                  trailing: const Icon(Icons.star, color: Colors.amber),
                );
              },
            );
          }
        },
      ),
    );
  }
}
