import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/theme.dart';

class SaveButton extends StatelessWidget {
  SaveButton(
    this.onEmptyChanged,
    this.filled,
    this.titleController,
    this.descriptionController,
  );

  final void Function(bool empty) onEmptyChanged;
  final bool filled;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: filled ? blue : Colors.grey),
      onPressed: () => filled
          ? saveToDo(
              context,
              onEmptyChanged,
              titleController.text,
              descriptionController.text,
            )
          : null,
      child: Text('저장'),
    );
  }
}

saveToDo(context, onEmptyChanged, newTitle, newDescription) {
  list.add(
    ToDoEntity(
      title: newTitle,
      description: newDescription,
      isFavorite: false,
      isDone: true,
    ),
  );
  list.add(
    ToDoEntity(
      title: "새로운 할 일 2",
      description: "세부 내용은 다음과 같습니다\n\n세부 내용은 여기에 작성합니다.",
      isFavorite: true,
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
