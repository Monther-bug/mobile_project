class SubmitSolutionRequest {
  final int problemId;
  final String code;
  final int? timeTaken; // Time taken in seconds

  SubmitSolutionRequest({
    required this.problemId,
    required this.code,
    this.timeTaken,
  });

  Map<String, dynamic> toJson() {
    return {
      'problem_id': problemId,
      'code': code,
      if (timeTaken != null) 'time_taken': timeTaken,
    };
  }
}

class Solution {
  final int id;
  final int userId;
  final int problemId;
  final String code;
  final String status; // 'pending', 'passed', 'failed'
  final int? timeTaken;
  final String? output;
  final DateTime createdAt;
  final DateTime updatedAt;

  Solution({
    required this.id,
    required this.userId,
    required this.problemId,
    required this.code,
    required this.status,
    this.timeTaken,
    this.output,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Solution.fromJson(Map<String, dynamic> json) {
    return Solution(
      id: json['id'],
      userId: json['user_id'],
      problemId: json['problem_id'],
      code: json['code'],
      status: json['status'],
      timeTaken: json['time_taken'],
      output: json['output'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'problem_id': problemId,
      'code': code,
      'status': status,
      'time_taken': timeTaken,
      'output': output,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isPassed => status == 'passed';
  bool get isFailed => status == 'failed';
  bool get isPending => status == 'pending';
}

class SolutionResponse {
  final Solution solution;
  final String message;

  SolutionResponse({required this.solution, required this.message});

  factory SolutionResponse.fromJson(Map<String, dynamic> json) {
    return SolutionResponse(
      solution: Solution.fromJson(json['data']),
      message: json['message'] ?? 'Solution submitted successfully',
    );
  }
}
