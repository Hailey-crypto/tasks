import 'package:flutter/material.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';

class ToDoDetailPage extends StatefulWidget {
  ToDoDetailPage(
    this.title,
    this.description,
    this.isFavorite,
    this.onFavoriteChanged,
  );

  final String title;
  final String? description;
  final bool isFavorite;
  final void Function() onFavoriteChanged;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [FavoriteButton(widget.isFavorite, widget.onFavoriteChanged)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [TitleBox(widget.title), DetailBox(widget.description)],
        ),
      ),
    );
  }
}

Widget TitleBox(title) {
  return Text(
    title,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Widget DetailBox(description) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      Icon(Icons.short_text_rounded),
      Expanded(
        child: Text(
          description == null ? SizedBox.shrink() : description,
          style: TextStyle(fontSize: 17),
        ),
      ),
    ],
  );
}

/*
widgets
- back_button ) BackButton
- favorite_button ) FavoriteButton
*/
