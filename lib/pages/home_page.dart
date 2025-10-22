import 'package:flutter/material.dart';
import '../widgets/no_todo.dart';
import '../widgets/todo_view.dart';
import 'package:tasks/widgets/add_todo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String mainTitle = "혜린's Tasks";

  bool empty = list.isEmpty;
  void onEmptyChanged(bool newEmpty) {
    setState(() => empty = newEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(mainTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            empty ? NoToDo(mainTitle) : ToDoView(empty, onEmptyChanged),
            AddToDo(empty, onEmptyChanged),
          ],
        ),
      ),
    );
  }
}

/*
widgets
-  no_todo ) NoToDo
-  todo_view ) ToDoView, list
-  add_todo ) AddToDo
*/
