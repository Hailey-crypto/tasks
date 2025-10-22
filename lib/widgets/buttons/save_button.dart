import 'package:flutter/material.dart';
import 'package:tasks/theme.dart';
import 'package:tasks/widgets/todo_view.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onEmptyChanged,
    required this.filled,
    required this.titleController,
    required this.descriptionController,
    required this.isFavorite,
  });

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
              context: context,
              onEmptyChanged: onEmptyChanged,
              titleController: titleController,
              descriptionController: descriptionController,
              isFavorite: isFavorite,
            )
          : null,
      child: Text('저장'),
    );
  }
}

// todo 를 생성하는 함수
saveToDo({
  required BuildContext context,
  required void Function(bool) onEmptyChanged,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required bool isFavorite,
}) {
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

// 스낵바를 띄우는 함수
snackBar(context) {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('할 일을 입력해주세요.'), duration: Duration(seconds: 2)),
  );
}
