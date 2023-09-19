class TodoModel {
  String todoText;
  bool isDone;

  TodoModel({
    required this.todoText,
    this.isDone = false,
  });

  void complete() {
    isDone = !isDone;
  }
}
