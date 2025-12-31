class Exercise {
  final int id;
  final String title;
  final String description;
  final String category;
  final List<Problem>? problems;
  final DateTime createdAt;
  final DateTime updatedAt;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.problems,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      problems: json['problems'] != null
          ? (json['problems'] as List).map((p) => Problem.fromJson(p)).toList()
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'problems': problems?.map((p) => p.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Problem {
  final int id;
  final int exerciseId;
  final String title;
  final String content;
  final String difficulty;
  final String? hint;
  final String? category; // Category from parent exercise
  final List<TestCase>? testCases;
  final DateTime createdAt;
  final DateTime updatedAt;

  Problem({
    required this.id,
    required this.exerciseId,
    required this.title,
    required this.content,
    required this.difficulty,
    this.hint,
    this.category,
    this.testCases,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      id: json['id'],
      exerciseId: json['exercise_id'],
      title: json['title'],
      content: json['content'],
      difficulty: json['difficulty'],
      hint: json['hint'],
      category: json['category'], // May come from exercise
      testCases: json['test_cases'] != null
          ? (json['test_cases'] as List)
                .map((tc) => TestCase.fromJson(tc))
                .toList()
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exercise_id': exerciseId,
      'title': title,
      'content': content,
      'difficulty': difficulty,
      'hint': hint,
      'category': category,
      'test_cases': testCases?.map((tc) => tc.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Mock data for development (can be removed later)
  static List<Problem> get mockList => [
    Problem(
      id: 1,
      exerciseId: 1,
      title: 'Two Sum',
      content:
          'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
      difficulty: 'easy',
      category: 'Arrays',
      hint: 'Try using a hash map to store the complement of each number.',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}

class TestCase {
  final int id;
  final int problemId;
  final String input;
  final String expectedOutput;
  final DateTime createdAt;
  final DateTime updatedAt;

  TestCase({
    required this.id,
    required this.problemId,
    required this.input,
    required this.expectedOutput,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TestCase.fromJson(Map<String, dynamic> json) {
    return TestCase(
      id: json['id'],
      problemId: json['problem_id'],
      input: json['input'],
      expectedOutput: json['expected_output'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'problem_id': problemId,
      'input': input,
      'expected_output': expectedOutput,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
