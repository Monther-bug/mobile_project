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
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      problemId: json['problem_id'] ?? 0,
      code: json['code'] ?? '',
      status: json['status'] ?? 'pending',
      timeTaken: json['time_taken'],
      output: json['output'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
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
  final ValidationResult? validation;

  SolutionResponse({
    required this.solution,
    required this.message,
    this.validation,
  });

  factory SolutionResponse.fromJson(Map<String, dynamic> json) {
    // Handle nested structure: { "data": { "solution": {...}, "validation": {...} }, "message": "..." }
    Map<String, dynamic> solutionData;
    ValidationResult? validationResult;
    
    if (json['data'] != null && json['data'] is Map) {
      final data = json['data'] as Map<String, dynamic>;
      if (data.containsKey('solution')) {
        // Nested: data.solution
        solutionData = data['solution'];
        if (data.containsKey('validation')) {
          validationResult = ValidationResult.fromJson(data['validation']);
        }
      } else {
        // Direct: data is the solution
        solutionData = data;
      }
    } else {
      solutionData = json;
    }
    
    return SolutionResponse(
      solution: Solution.fromJson(solutionData),
      message: json['message'] ?? 'Solution submitted successfully',
      validation: validationResult,
    );
  }
}

class ValidationResult {
  final String status;
  final String message;
  final List<TestResult> testResults;
  final double totalExecutionTime;

  ValidationResult({
    required this.status,
    required this.message,
    required this.testResults,
    required this.totalExecutionTime,
  });

  factory ValidationResult.fromJson(Map<String, dynamic> json) {
    return ValidationResult(
      status: json['status'] ?? 'pending',
      message: json['message'] ?? '',
      testResults: (json['test_results'] as List? ?? [])
          .map((e) => TestResult.fromJson(e))
          .toList(),
      totalExecutionTime: (json['total_execution_time'] ?? 0).toDouble(),
    );
  }

  bool get isPassed => status == 'passed';
  bool get isFailed => status == 'failed';
  int get passedCount => testResults.where((t) => t.passed).length;
  int get totalCount => testResults.length;
}

class TestResult {
  final int testCase;
  final String input;
  final String expected;
  final String actual;
  final bool passed;
  final String? error;
  final double executionTime;

  TestResult({
    required this.testCase,
    required this.input,
    required this.expected,
    required this.actual,
    required this.passed,
    this.error,
    required this.executionTime,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      testCase: json['test_case'] ?? 0,
      input: json['input'] ?? '',
      expected: json['expected'] ?? '',
      actual: json['actual'] ?? '',
      passed: json['passed'] ?? false,
      error: json['error'],
      executionTime: (json['execution_time'] ?? 0).toDouble(),
    );
  }
}
