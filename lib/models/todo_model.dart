
class ToDo {
  String? time;
  String? todoText;
  bool isDone;

  ToDo({
    required this.time,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(time: 'sep 12,2023', todoText: 'Morning Excercise', isDone: true),
      ToDo(time: 'sep 11,2023', todoText: 'Check Email'),
      ToDo(time: 'sep 10,2023', todoText: 'Team Meating', isDone: true),
      ToDo(time: 'sep 05,2023', todoText: 'Work  on mobile apps'),
      ToDo(time: 'sep 02,2023', todoText: 'Dinner'),
    ];
  }
}
