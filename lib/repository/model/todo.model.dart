class Todo {
  String title;
  DateTime createdAt;
  bool isDone;

  Todo({
    required this.title,
    required this.createdAt,
    required this.isDone,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        isDone = json['isDone'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
        'createdAt': createdAt.toIso8601String(),
      };

  Todo copyWith({
    String? title,
    DateTime? createdAt,
    bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      isDone: isDone ?? this.isDone,
    );
  }
}
