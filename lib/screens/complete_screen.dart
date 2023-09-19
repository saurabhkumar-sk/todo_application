import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      selector: (p0, p1) => p1.tasks,
      builder: (context, complete, child) => Column(
        children: [
          complete.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Selector<TodoProvider, List<TodoModel>>(
                      selector: (p0, p1) => p1.tasks,
                      builder: (context, todosList, child) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: provider.tasks[index].isDone
                                ? ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    tileColor:
                                        const Color.fromRGBO(97, 94, 255, 1),
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
                                      provider.tasks[index].todoText,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.white),
                                    ),
                                    trailing: Checkbox(
                                      value: provider.tasks[index].isDone,
                                      onChanged: (value) => provider.toggleTask(
                                        provider.tasks[index],
                                      ),
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                )
              : FloatingActionButton(
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
                              // onSubmitted: (value) => sumbit(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50.0),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                provider.addTask(textController.text);
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
                    // : Icons.delete_outline_rounded,
                    // color: Colors.red,
                  ),
                )
        ],
      ),
    );
  }
}
