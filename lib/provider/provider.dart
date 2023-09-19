import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<ToDoModel> todoList = [
    ToDoModel(
      todoText: 'Morning Exercise',
      isDone: true,
    ),
    ToDoModel(
      todoText: 'todoText',
      isDone: true,
    ),
    ToDoModel(
      todoText: 'todoText12',
      isDone: true,
    ),
  ];

  List<ToDoModel> get todosLists =>
      todoList.where((element) => element.isDone).toList();

  void addToList(ToDoModel todo) {
    todosLists.add(todo);
    notifyListeners();
  }
}
