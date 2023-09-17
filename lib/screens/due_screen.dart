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
  List<ToDo> tasks = todoList();
  final textController = TextEditingController();
  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const SizedBox(height: 250),
          // const Icon(
          //   Icons.add_box_outlined,
          //   size: 100,
          //   color: Colors.grey,
          // ),
          // const Text('No Task Left'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: const Color.fromRGBO(97, 94, 255, 1),
                child: ListTile(
                  title: Text(
                    tasks[index].todoText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    tasks[index].isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 100,
          ),
          // TextField(
          //   controller: textController,
          //   decoration: const InputDecoration(
          //     fillColor: Colors.grey,
          //     filled: true,
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     tasks.add;
          //     textController.clear();
          //     setState(() {});
          //   },
          //   child: const Text('Add'),
          // )
        ],
      ),
    );
  }
}
