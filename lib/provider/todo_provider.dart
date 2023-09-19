import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final tasks = [
    TodoModel(
      todoText: 'Morning Exercise',
      isDone: false,
    ),
    TodoModel(
      todoText: 'todoText',
      isDone: false,
    ),
    TodoModel(
      todoText: 'todoText12',
      isDone: true,
    ),
  ];

  void addTask(String task) {
    tasks.add(
      TodoModel(todoText: task, isDone: false),
    );
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].complete();
    notifyListeners();
  }

  void removeTask(String task) {
    tasks.remove(
      TodoModel(todoText: task),
    );
    notifyListeners();
  }

  // bool change = false;
  // void changeButton() {
  //   if (tasks.isNotEmpty) {
  //     change = true;
  //   } else {
  //     change = false;
  //   }
  // }
}
