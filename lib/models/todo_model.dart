class TodoModel {
  String title;
  bool isDone;

  TodoModel({
    required this.title,
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  void complete() {
    isDone = !isDone;
  }
}
