import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'Notes',
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
