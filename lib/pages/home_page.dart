import 'package:flutter/material.dart';
import '../widgets/no_todo.dart';
import '../widgets/todo_view.dart';
import 'package:tasks/widgets/add_todo.dart';

class ToDoEntity {
  ToDoEntity({
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
  });

  final String title;
  final String? description;
  bool isFavorite;
  final bool isDone;
}

List<ToDoEntity> list = [];

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
            empty ? NoToDo(mainTitle) : ToDoView(),
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
-  todo_view ) ToDoView
-  add_todo ) AddToDo
*/
