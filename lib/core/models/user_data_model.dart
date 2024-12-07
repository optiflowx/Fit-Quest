class UserAchievement {
  final String username;
  final int points;

  UserAchievement({required this.username, required this.points});

  // Factory method to create a UserAchievement from Firestore document snapshot
  factory UserAchievement.fromFirestore(Map<String, dynamic> doc) {
    return UserAchievement(
      username: doc['username'],
      points: doc['points'],
    );
  }
}
