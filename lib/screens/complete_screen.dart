import 'package:flutter/material.dart';
import 'package:todo/screens/landing_screen.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const  LandingScreen(name: ''),
                ));
          },
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
