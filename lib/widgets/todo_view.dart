import 'package:flutter/material.dart';
import 'package:tasks/widgets/todo_box.dart';

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

class ToDoView extends StatefulWidget {
  ToDoView(this.empty, this.onEmptyChanged);

  final bool empty;
  final void Function(bool empty) onEmptyChanged;

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final todo = list[index];
          return ToDoBox(
            title: todo.title,
            description: todo.description,
            isFavorite: todo.isFavorite,
            isDone: todo.isDone,
            index: index,
            onDeleted: () {
              setState(() {});
              widget.onEmptyChanged(list.isEmpty);
            },
            onFavoriteChanged: () {
              setState(() {
                list[index].isFavorite = !list[index].isFavorite;
              });
            },
          );
        },
      ),
    );
  }
}

/*
widgets
- todo_box ) ToDoBox
*/
