class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void isChange() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      isDone: map['isDone'],
    );
  }
}
