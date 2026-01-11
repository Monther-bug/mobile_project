class Category {
  final String name;
  final int exerciseCount;
  final String icon;

  Category({
    required this.name,
    required this.exerciseCount,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] ?? 'Unknown',
      exerciseCount: json['exercise_count'] ?? 0,
      icon: json['icon'] ?? 'code',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'exercise_count': exerciseCount, 'icon': icon};
  }
}
