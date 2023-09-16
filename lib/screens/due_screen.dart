import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class DueTaskScreen extends StatefulWidget {
  const DueTaskScreen({
    super.key,
  });

  @override
  State<DueTaskScreen> createState() => _DueTaskScreenState();
}

class _DueTaskScreenState extends State<DueTaskScreen> {
  // final String Isdone = isDone;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ToDo.todoList().length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: const Color.fromRGBO(97, 94, 255, 1),
            child: ListTile(
              title: Text(
                ToDo.todoList()[index].todoText.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(
                Icons.check_box_outline_blank,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
