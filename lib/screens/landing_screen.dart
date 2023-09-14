import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, required this.title});
  final String title;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextField(
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 239, 221, 227),
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100),
            ),
            filled: true,
            hintText: 'Search your notes',
            prefixIcon: const Icon(Icons.menu),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('https://picsum.photos/205/300'),
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              "All ToDos",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
