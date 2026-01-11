class LeaderboardEntry {
  final int rank;
  final String userName;
  final int problemsSolved;
  final int totalScore;

  LeaderboardEntry({
    required this.rank,
    required this.userName,
    required this.problemsSolved,
    required this.totalScore,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(
      rank: json['rank'] ?? 0,
      userName: json['user_name'] ?? json['name'] ?? 'Unknown',
      problemsSolved: json['problems_solved'] ?? 0,
      totalScore: json['total_score'] ?? json['score'] ?? 0,
    );
  }
}

class UserProgress {
  final int userId;
  final int exerciseId;
  final bool isCompleted;
  final DateTime? completedAt;

  UserProgress({
    required this.userId,
    required this.exerciseId,
    required this.isCompleted,
    this.completedAt,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      userId: json['user_id'],
      exerciseId: json['exercise_id'],
      isCompleted: json['is_completed'] == 1 || json['is_completed'] == true,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'exercise_id': exerciseId,
      'is_completed': isCompleted,
      'completed_at': completedAt?.toIso8601String(),
    };
  }
}

class UserStats {
  final int problemsSolved;
  final int currentStreak;
  final String streakLabel;
  final int totalPoints;
  final int rank;
  final int longestStreak;

  UserStats({
    required this.problemsSolved,
    required this.currentStreak,
    required this.streakLabel,
    required this.totalPoints,
    required this.rank,
    required this.longestStreak,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      problemsSolved: json['problems_solved'] ?? 0,
      currentStreak: json['current_streak'] ?? 0,
      streakLabel: json['streak_label'] ?? '0 Days',
      totalPoints: json['total_points'] ?? 0,
      rank: json['rank'] ?? 0,
      longestStreak: json['longest_streak'] ?? 0,
    );
  }
}

class UserProfile {
  final int id;
  final String name;
  final String email;
  final int rank;
  final int totalUsers;
  final int totalPoints;
  final int problemsSolved;
  final int exercisesCompleted;
  final int currentStreak;
  final int longestStreak;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.rank,
    required this.totalUsers,
    required this.totalPoints,
    required this.problemsSolved,
    required this.exercisesCompleted,
    required this.currentStreak,
    required this.longestStreak,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? '',
      rank: json['rank'] ?? 0,
      totalUsers: json['total_users'] ?? 0,
      totalPoints: json['total_points'] ?? 0,
      problemsSolved: json['problems_solved'] ?? 0,
      exercisesCompleted: json['exercises_completed'] ?? 0,
      currentStreak: json['current_streak'] ?? 0,
      longestStreak: json['longest_streak'] ?? 0,
    );
  }
}
