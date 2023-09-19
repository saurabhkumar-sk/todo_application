import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/screens/complete_screen.dart';
import 'package:todo/screens/due_task_screen.dart';

class LandingScreen extends StatefulWidget {
  final String name;
  const LandingScreen({super.key, required this.name});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final textController = TextEditingController();

  late TodoProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'My Todo App',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            tabs: [
              Tab(
                child: Text(
                  'Due Task',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
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
        ),
        body: const TabBarView(
          children: [
            DueTaskScreen(),
            CompleteScreen(),
          ],
        ),
      ),
    );
  }
}
