import 'package:flutter/material.dart';
import 'package:tasks/widgets/buttons/description_button.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';
import 'package:tasks/widgets/buttons/save_button.dart';

class BottomSheet extends StatefulWidget {
  BottomSheet(this.empty, this.onEmptyChanged);

  final bool empty;
  final void Function(bool empty) onEmptyChanged;

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  bool spread = false;
  void onSpreadChanged(bool newSpread) {
    setState(() => spread = newSpread);
  }

  bool isFavorite = false;
  void onFavoriteChanged() {
    setState(() => isFavorite = !isFavorite);
  }

  // TextField 입력값 받기
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool filled = false;
  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {
        filled = titleController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 12,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                autofocus: true,
                onSubmitted: (value) {
                  titleController.text.isEmpty
                      ? snackBar(context)
                      : saveToDo(
                          context,
                          widget.onEmptyChanged,
                          titleController,
                          descriptionController,
                          isFavorite,
                        );
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '새 할 일',
                ),
              ),
              spread
                  ? DescriptionField(
                      context,
                      widget.onEmptyChanged,
                      titleController,
                      descriptionController,
                      isFavorite,
                    )
                  : SizedBox.shrink(),
              Row(
                children: [
                  DescriptionButton(spread, onSpreadChanged),
                  FavoriteButton(isFavorite, onFavoriteChanged),
                  Spacer(),
                  SaveButton(
                    widget.onEmptyChanged,
                    filled,
                    titleController,
                    descriptionController,
                    isFavorite,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
widgets
-  description_button ) DescriptionButton, DescriptionField
-  favorite_button ) FavoriteButton
-  save_button ) SaveButton, saveToDo(), snackBar()
*/
