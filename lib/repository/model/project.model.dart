class Project {
  String title;
  DateTime createdAt;

  Project({required this.title, required this.createdAt});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'createdAt': createdAt.toIso8601String(),
      };
}
