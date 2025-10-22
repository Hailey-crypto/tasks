import 'package:flutter/material.dart';
import 'package:tasks/pages/todo_detail_page.dart';
import 'package:tasks/widgets/buttons/done_button.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';
import 'package:tasks/widgets/delete_dialog.dart';

class ToDoBox extends StatefulWidget {
  const ToDoBox({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
    required this.index,
    required this.onFavoriteChanged,
    required this.onDoneChanged,
    required this.onDeleted,
  });

  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;
  final int index;
  final void Function() onFavoriteChanged;
  final void Function() onDoneChanged;
  final void Function() onDeleted;

  @override
  State<ToDoBox> createState() => _ToDoBoxState();
}

class _ToDoBoxState extends State<ToDoBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 길게 탭 : 나만의 기능(To Do 삭제 기능) 실행
      onLongPress: () => deleteDialog(
        context: context,
        title: widget.title,
        index: widget.index,
        onDeleted: widget.onDeleted,
      ),
      // 짧게 탭 : ToDoDetailPage 로 이동
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ToDoDetailPage(
                title: widget.title,
                description: widget.description,
                isFavorite: widget.isFavorite,
                onFavoriteChanged: widget.onFavoriteChanged,
              );
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
            DoneButton(widget.isDone, widget.onDoneChanged),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                decoration: widget.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            Spacer(),
            FavoriteButton(widget.isFavorite, widget.onFavoriteChanged),
          ],
        ),
      ),
    );
  }
}
