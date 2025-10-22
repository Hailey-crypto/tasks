import 'package:flutter/material.dart';
import 'package:tasks/theme.dart';
import 'package:tasks/widgets/todo_view.dart';

class SaveButton extends StatelessWidget {
  SaveButton(
    this.onEmptyChanged,
    this.filled,
    this.titleController,
    this.descriptionController,
    this.isFavorite,
  );

  final void Function(bool empty) onEmptyChanged;
  final bool filled;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: filled ? blue : Colors.grey),
      onPressed: () => filled
          ? saveToDo(
              context,
              onEmptyChanged,
              titleController,
              descriptionController,
              isFavorite,
            )
          : null,
      child: Text('저장'),
    );
  }
}

saveToDo(
  context,
  onEmptyChanged,
  titleController,
  descriptionController,
  isFavorite,
) {
  list.add(
    ToDoEntity(
      title: titleController.text,
      description: descriptionController.text,
      isFavorite: isFavorite,
      isDone: false,
    ),
  );
  Navigator.pop(context);
  onEmptyChanged(false);
}

snackBar(context) {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('할 일을 입력해주세요.'), duration: Duration(seconds: 2)),
  );
}
