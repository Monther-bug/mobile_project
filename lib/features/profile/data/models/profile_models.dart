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
  final int totalSubmissions;
  final int successRate;

  UserStats({
    required this.problemsSolved,
    required this.currentStreak,
    required this.totalSubmissions,
    required this.successRate,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      problemsSolved: json['problems_solved'] ?? 0,
      currentStreak: json['current_streak'] ?? 0,
      totalSubmissions: json['total_submissions'] ?? 0,
      successRate: json['success_rate'] ?? 0,
    );
  }
}
