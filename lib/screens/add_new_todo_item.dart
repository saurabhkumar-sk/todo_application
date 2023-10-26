import 'package:flutter/material.dart';

class AddNewToDoItemScreen extends StatefulWidget {
  const AddNewToDoItemScreen({super.key});

  @override
  State<AddNewToDoItemScreen> createState() => _AddNewToDoItemScreenState();
}

class _AddNewToDoItemScreenState extends State<AddNewToDoItemScreen> {
  final textcontroller = TextEditingController();
  final textcontroller2 = TextEditingController();

  @override
  void dispose() {
    textcontroller.dispose();
    textcontroller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade100,
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Todo Name',
                  style: TextStyle(
                    fontSize: 16.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                  filled: true,
                  counter: Text(
                    textcontroller.text.length.toString(),
                  ),
                  hintText: "Enter Todo's item",
                  hintStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  errorText: 'Minimum 5 charactor required',
                ),
              ),
              const Text(
                'Message(Optional)',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                maxLines: 500,
                minLines: 10,
                controller: textcontroller2,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Write something about your todo here...',
                  hintStyle: const TextStyle(
                    fontSize: 17,
                  ),
                  counter: Text(
                    textcontroller2.text.length.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
