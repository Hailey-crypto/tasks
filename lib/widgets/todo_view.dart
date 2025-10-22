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
  bool isDone;
}

List<ToDoEntity> list = []; // list = ToDoEntity 객체들로 이루어진 리스트

class ToDoView extends StatefulWidget {
  const ToDoView(this.empty, this.onEmptyChanged, {super.key});

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
          final ToDoEntity todo = list[index]; // todo = ToDoEntity 각 객체들
          return ToDoBox(
            title: todo.title,
            description: todo.description,
            isFavorite: todo.isFavorite,
            isDone: todo.isDone,
            index: index,
            onFavoriteChanged: () {
              // todo 의 즐겨찾기 여부 상태변경 후 ToDoBox rebuild
              setState(() => todo.isFavorite = !todo.isFavorite);
            },
            onDoneChanged: () {
              // todo 의 완료 여부 상태변경 후 ToDoBox rebuild
              setState(() => todo.isDone = !todo.isDone);
            },
            onDeleted: () {
              // todo 삭제 후 ToDoBox rebuild > 빈 리스트 여부 확인 후 HomePage rebuild
              setState(() {});
              widget.onEmptyChanged(list.isEmpty);
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
