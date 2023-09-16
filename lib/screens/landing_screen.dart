import 'package:flutter/material.dart';
import 'package:todo/screens/complete_screen.dart';
import 'package:todo/screens/due_screen.dart';

class LandingScreen extends StatefulWidget {
  final String name;
  const LandingScreen({super.key, required this.name});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool tabTask = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Todo App',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
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
          backgroundColor: Colors.purple.shade100,
          onPressed: () {},
          child: const Icon(Icons.add),
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
