import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final _tasks = <TodoModel>[
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
  List<TodoModel> get dueTask =>
      _tasks.where((element) => element.isDone == false).toList();

  List<TodoModel> get completedTask =>
      _tasks.where((element) => element.isDone).toList();

  void addTask(TodoModel value) {
    _tasks.add(value);
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    _tasks[_tasks.indexOf(task)].complete();
    notifyListeners();
  }

  // void removeTask(int value) {
  //   dueTask.removeAt(value);
  //   notifyListeners();
  // }

  void removeCompletedTasks() {
    _tasks.removeWhere((task) => task.isDone);
    notifyListeners();
  }
}
