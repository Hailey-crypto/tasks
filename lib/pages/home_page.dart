import 'package:flutter/material.dart';
import 'package:tasks/widgets/no_todo.dart';
import 'package:tasks/widgets/todo_view.dart';
import 'package:tasks/widgets/add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String mainTitle = "혜린's Tasks";

  bool empty = list.isEmpty;
  void onEmptyChanged(bool newEmpty) {
    // 빈 리스트 여부 확인 후 HomePage rebuild
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            empty ? NoToDo(mainTitle) : ToDoView(empty, onEmptyChanged),
            AddToDo(empty, onEmptyChanged),
          ],
        ),
      ),
    );
  }
}
