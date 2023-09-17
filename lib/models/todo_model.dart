class ToDo {
  String time;
  String todoText;
  bool isDone;

  ToDo({
    required this.time,
    required this.todoText,
    this.isDone = false,
  });
}

List<ToDo> todoList() {
  return [
    ToDo(time: 'sep 12,2023', todoText: 'Morning Excercise', isDone: true),
    ToDo(time: 'sep 11,2023', todoText: 'Check Email'),
    ToDo(time: 'sep 10,2023', todoText: 'Team Meating', isDone: true),
    ToDo(time: 'sep 05,2023', todoText: 'Work  on mobile apps'),
    ToDo(time: 'sep 02,2023', todoText: 'Dinner'),
  ];
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       home: TodoList(),
//     );
//   }
// }

// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   List<String> tasks = [];
//   TextEditingController taskController = TextEditingController();

//   void addTask(String task) {
//     setState(() {
//       tasks.add(task);
//       taskController.clear();
//     });
//   }

//   void removeTask(int index) {
//     setState(() {
//       tasks.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To-Do List'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: taskController,
//                     decoration: InputDecoration(
//                       labelText: 'New Task',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     addTask(taskController.text);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(tasks[index]),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       removeTask(index);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
