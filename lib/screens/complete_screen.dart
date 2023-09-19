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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (provider.completeTask.isEmpty)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_outlined,
                size: 118,
                color: Colors.grey,
              ),
            )
          else
            const Text(
              'Click To Add',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
