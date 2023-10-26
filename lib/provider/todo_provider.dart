import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/components/db_helper.dart';
import 'package:todo/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  // final _tasks = <TodoModel>[
  // TodoModel(
  //   title: 'Morning Exercise',
  //   isDone: false,
  // ),
  // TodoModel(
  //   title: 'title',
  //   isDone: false,
  // ),
  // TodoModel(
  //   title: 'title12',
  //   isDone: true,
  // ),
  // ];
  // List<TodoModel> get dueTask =>
  //     _tasks.where((element) => element.isDone == false).toList();

  // List<TodoModel> get completedTask =>
  //     _tasks.where((element) => element.isDone).toList();

  // void addTask(TodoModel value) {
  //   _tasks.add(value);
  //   notifyListeners();
  // }

  // void toggleTask(TodoModel task) {
  //   _tasks[_tasks.indexOf(task)].complete();
  //   notifyListeners();
  // }

  // void removeCompletedTasks() {
  //   _tasks.removeWhere((task) => task.isDone);
  //   notifyListeners();
  // }

//SqLite
  List<TodoModel> _todos = [
    // TodoModel(
    //   title: 'Morning Exercise',
    //   isDone: false,
    // ),
  ];
  List<TodoModel> get dueTask =>
      _todos.where((element) => element.isDone == false).toList();

  List<TodoModel> get completedTask =>
      _todos.where((element) => element.isDone).toList();

  void toggleTask(TodoModel task) {
    _todos[_todos.indexOf(task)].complete();
    notifyListeners();
  }

  void removeCompletedTasks() {
    _todos.removeWhere((task) => task.isDone);
    notifyListeners();
  }

  Future<void> getTodos() async {
    final response = await DBHelper.instance.getTodos();
    _todos = response;
    notifyListeners();
  }

  Future<void> delete(TodoModel todo) async {
    final response = await DBHelper.instance.delete(todo);
    // _todos.removeWhere((task) => task.isDone);
    notifyListeners();

    return response;
  }
}
