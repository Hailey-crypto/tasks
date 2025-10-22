import 'package:flutter/material.dart';
import 'package:tasks/pages/todo_detail_page.dart';
import 'package:tasks/widgets/buttons/done_button.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';
import 'package:tasks/widgets/delete_dialog.dart';

class ToDoBox extends StatefulWidget {
  const ToDoBox({
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
    required this.index,
    required this.onDelete,
  });

  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;
  final int index;
  final void Function() onDelete;

  @override
  State<ToDoBox> createState() => _ToDoBoxState();
}

class _ToDoBoxState extends State<ToDoBox> {
  bool isDone = false;
  void onDoneChanged(bool newDone) {
    setState(() => isDone = newDone);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () =>
          deleteDialog(context, widget.title, widget.index, widget.onDelete),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ToDoDetailPage(widget.title, widget.description);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 12,
          children: [
            DoneButton(isDone, onDoneChanged),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            Spacer(),
            FavoriteButton(),
          ],
        ),
      ),
    );
  }
}

/*
widgets
- delete_dialog) deleteDialog(), deleteToDo()
- done_button ) DoneButton
- favorite_button ) FavoriteButton
*/
