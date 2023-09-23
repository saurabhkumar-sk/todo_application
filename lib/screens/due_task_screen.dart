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
        backgroundColor: const Color.fromARGB(255, 51, 51, 88),
        shape: const CircleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 51, 51, 90),
            width: 2,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
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
                          Radius.circular(12),
                        ),
                      ),
                      hintText: 'Enter Your Task',
                      fillColor: Color.fromRGBO(116, 116, 116, 1),
                      filled: true,
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 51, 51, 87),
                  onPressed: () {
                    // provider.completedTask
                    //     .add(TodoModel(todoText: textController.text));
                    provider.addTask(TodoModel(todoText: textController.text));
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
                        color: Color.fromARGB(255, 106, 52, 243),
                      )
                    ],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Selector<TodoProvider, List<TodoModel>>(
              selector: (p0, p1) => p1.dueTask,
              builder: (context, task, child) => task.isEmpty
                  ? const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 230, horizontal: 137),
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            size: 100,
                            color: Color.fromRGBO(47, 47, 47, 1),
                          ),
                          Text(
                            'No Task Left',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(47, 47, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: task.length,
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
                                        task[index].todoText,
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
                                provider.dueTask[index].todoText,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: task[index].isDone
                                    ? const Icon(Icons.check_box_outlined)
                                    : const Icon(
                                        Icons.check_box_outline_blank_outlined),
                                onPressed: () {
                                  provider.toggleTask(task[index]);
                                  setState(() {});
                                },
                              ),
                            ));
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
