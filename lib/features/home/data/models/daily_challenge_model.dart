class DailyChallenge {
  final int id;
  final String title;
  final String difficulty;
  final String category;
  final String? exerciseTitle;
  final int exerciseId;
  final bool isCompleted;
  final int points;
  final String date;

  DailyChallenge({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.category,
    this.exerciseTitle,
    required this.exerciseId,
    required this.isCompleted,
    required this.points,
    required this.date,
  });

  factory DailyChallenge.fromJson(Map<String, dynamic> json) {
    return DailyChallenge(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      difficulty: json['difficulty'] ?? 'Easy',
      category: json['category'] ?? 'General',
      exerciseTitle: json['exercise_title'],
      exerciseId: json['exercise_id'] ?? 0,
      isCompleted: json['is_completed'] ?? false,
      points: json['points'] ?? 10,
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'difficulty': difficulty,
      'category': category,
      'exercise_title': exerciseTitle,
      'exercise_id': exerciseId,
      'is_completed': isCompleted,
      'points': points,
      'date': date,
    };
  }

  /// Get color based on difficulty
  String get difficultyColor {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return 'green';
      case 'medium':
        return 'orange';
      case 'hard':
        return 'red';
      default:
        return 'grey';
    }
  }
}
