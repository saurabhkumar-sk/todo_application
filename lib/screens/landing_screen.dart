import 'package:flutter/material.dart';
import 'package:todo/screens/complete_screen.dart';
import 'package:todo/screens/due_task_screen.dart';

class LandingScreen extends StatelessWidget {
  final String name;
  LandingScreen({super.key, required this.name});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
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
        body: const TabBarView(
          children: [
            DueTaskScreen(
              no: 1,
            ),
            CompleteScreen(
              no: 1,
            ),
          ],
        ),
      ),
    );
  }
}
