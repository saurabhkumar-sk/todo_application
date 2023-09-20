import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/provider/todo_provider.dart';

class DueTaskScreen extends StatefulWidget {
  const DueTaskScreen({
    super.key,
  });

  @override
  State<DueTaskScreen> createState() => _DueTaskScreenState();
}

class _DueTaskScreenState extends State<DueTaskScreen> {
  final textController = TextEditingController();
  late TodoProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 102, 101, 102),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
            context: context,
            builder: (context) => Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Enter Your Task',
                  style: TextStyle(
                    color: Color.fromRGBO(116, 116, 116, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 15,
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      hintText: 'Enter Your Task',
                      fillColor: Color.fromRGBO(116, 116, 116, 1),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      provider
                          .addTask(TodoModel(todoText: textController.text));
                      textController.clear();
                      Navigator.pop(context);
                    },
                    label: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add_circle_outline_sharp,
        ),
      ),
      body: Selector<TodoProvider, List>(
        selector: (p0, p1) => p1.tasks,
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
                trailing: IconButton(
                  icon: todosList[index].isDone
                      ? const Icon(Icons.check_box_outlined)
                      : const Icon(Icons.check_box_outline_blank_outlined),
                  onPressed: () {
                    // todosList[index].isDone == false
                    // ?
                    provider.toggleTask(todosList[index]);
                    // : provider.removeTask(index);

                    setState(() {});
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
