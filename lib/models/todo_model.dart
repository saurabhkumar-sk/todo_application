class TodoModel {
  final int id;
  final String title;
  bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'title': title,
    };
  }

  void complete() {
    isDone = !isDone;
  }
}
