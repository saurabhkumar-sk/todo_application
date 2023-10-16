import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/db_helper.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/provider/todo_provider.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({
    super.key,
  });

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  late TodoProvider provider;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<TodoModel>>(
      selector: (p0, p1) => p1.completedTask,
      builder: (context, completeTask, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        floatingActionButton: Stack(
          children: [
            if (completeTask.isNotEmpty)
              FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 67, 27, 27),
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 67, 27, 27),
                    width: 2,
                  ),
                ),
                onPressed: () {
                  provider.removeCompletedTasks();
                  setState(() {});
                },
                child: const Icon(Icons.delete_outlined,
                    color: Color.fromRGBO(255, 45, 45, 1)),
              )
            else
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 51, 51, 87),
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 51, 51, 87),
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor:
                                const Color.fromRGBO(24, 24, 24, 1),
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
                                    style: const TextStyle(color: Colors.white),
                                    controller: textController,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      hintText: 'Enter Your Task',
                                      fillColor:
                                          Color.fromRGBO(116, 116, 116, 0.5),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50.0),
                                  child: FloatingActionButton.extended(
                                    backgroundColor:
                                        const Color.fromARGB(255, 51, 51, 87),
                                    onPressed: () {
                                      DBHelper.instance.createTodos(TodoModel(
                                          title: textController.text));
                                      context.read<TodoProvider>().getTodos();
                                      textController.clear();
                                      Navigator.pop(context);
                                    },
                                    label: const Row(
                                      children: [
                                        Text(
                                          'Add ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle_outline,
                                          size: 24,
                                          color:
                                              Color.fromARGB(255, 106, 52, 243),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: Color.fromARGB(255, 106, 52, 243),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Click To Add',
                          style: TextStyle(
                              color: Color.fromRGBO(62, 62, 62, 1),
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: completeTask.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromRGBO(97, 94, 255, 0.12),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          completeTask[index].title,
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
                  completeTask[index].title,
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  icon: completeTask[index].isDone
                      ? const Icon(
                          Icons.check_box_outlined,
                          color: Color.fromRGBO(97, 93, 255, 1),
                        )
                      : const Icon(Icons.check_box_outline_blank_outlined),
                  onPressed: () {
                    provider.toggleTask(completeTask[index]);
                    setState(() {});
                  },
                ),
              ),
              // : null,
            );
          },
        ),
      ),
    );
  }
}
