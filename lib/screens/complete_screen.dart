import 'package:flutter/material.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({
    super.key,
  });

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
  
}

class _CompleteScreenState extends State<CompleteScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_box_outlined,
            size: 118,
            color: Colors.grey,
          ),
        ),
        const Text(
          'Click To Add',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


