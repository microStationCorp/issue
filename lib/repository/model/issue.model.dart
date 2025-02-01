class Issue {
  String title;
  DateTime createdAt;
  bool isSolved;

  Issue({
    required this.title,
    required this.createdAt,
    required this.isSolved,
  });

  Issue.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        isSolved = json['isSolved'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'isSolved': isSolved,
        'createdAt': createdAt.toIso8601String(),
      };
}
