import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_quest/core/models/user_data_model.dart'; // Import the UserAchievement model

class LeaderboardRepository {
  final _firestore = FirebaseFirestore.instance;

  // Method to get the leaderboard data
  Future<List<UserAchievement>> getLeaderboard() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users') // Make sure this is the correct collection name
          .orderBy('points', descending: true)
          .limit(10) // Limit the number of results if needed
          .get();

      List<UserAchievement> leaderboard = snapshot.docs.map((doc) {
        return UserAchievement.fromFirestore(
            doc.data() as Map<String, dynamic>);
      }).toList();

      return leaderboard;
    } catch (e) {
      print('Error fetching leaderboard: $e');
      return [];
    }
  }
}
