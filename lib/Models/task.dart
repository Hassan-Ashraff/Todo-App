class Task {
  final String name;
  bool isDone;

  Task({
     required this.name,
     this.isDone = false,
  });
  void isChange(){
      isDone = !isDone;
  }
}
