import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final tasks = <TodoModel>[
    TodoModel(
      todoText: 'Morning Exercise',
      isDone: false,
    ),
    // TodoModel(
    //   todoText: 'todoText',
    //   isDone: false,
    // ),
    // TodoModel(
    //   todoText: 'todoText12',
    //   isDone: true,
    // ),
  ];

  List<TodoModel> get completedTask =>
      tasks.where((element) => element.isDone).toList();

  void addTask(TodoModel value) {
    tasks.add(value);
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    tasks[tasks.indexOf(task)].complete();
    notifyListeners();
  }

  void removeTask(int value) {
    tasks.removeAt(value);
    notifyListeners();
  }
}
