import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/provider/provider.dart';

class DueTaskScreen extends StatefulWidget {
  const DueTaskScreen({
    super.key,
  });

  @override
  State<DueTaskScreen> createState() => _DueTaskScreenState();
}

class _DueTaskScreenState extends State<DueTaskScreen> {
  final textController = TextEditingController();
  bool isdone = true;

  late TodoProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<ToDoModel>>(
      selector: (p0, p1) => p1.todoList,
      builder: (context, todosList, child) => ListView.builder(
        shrinkWrap: true,
        itemCount: todosList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: const Color.fromRGBO(97, 94, 255, 1),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        todosList[index].todoText,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              title: Text(
                todosList[index].todoText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                todosList[index].todoText.isNotEmpty
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
