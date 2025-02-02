import 'package:flutter/material.dart';
import 'package:todolist/pages/todo_list_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListPage(),
    );
  }
}
