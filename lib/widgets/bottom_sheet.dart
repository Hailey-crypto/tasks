import 'package:flutter/material.dart';
import 'package:tasks/widgets/buttons/description_button.dart';
import 'package:tasks/widgets/buttons/favorite_button.dart';
import 'package:tasks/widgets/buttons/save_button.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet(this.empty, this.onEmptyChanged, {super.key});

  final bool empty;
  final void Function(bool empty) onEmptyChanged;

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  bool spread = false;
  void onSpreadChanged(bool newSpread) {
    // 세부내용 입력창 표시 여부 상태변경 후 BottomSheet rebuild
    setState(() => spread = newSpread);
  }

  bool isFavorite = false;
  void onFavoriteChanged() {
    // 즐겨찾기 여부 상태변경 후 BottomSheet rebuild
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
      // title TextField 의 입력값 존재 여부 확인 후 BottomSheet rebuild
      setState(() => filled = titleController.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 상태변경 시 BottomSheet 내부만 rebuild 하기 위한 위젯
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
                      // title TextField 입력값이 없을 때 스낵바 띄우는 기능 실행
                      ? snackBar(context)
                      : saveToDo(
                          context: context,
                          onEmptyChanged: widget.onEmptyChanged,
                          titleController: titleController,
                          descriptionController: descriptionController,
                          isFavorite: isFavorite,
                        );
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '새 할 일',
                ),
              ),
              spread
                  ? DescriptionField(
                      context: context,
                      onEmptyChanged: widget.onEmptyChanged,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      isFavorite: isFavorite,
                    )
                  : SizedBox.shrink(),
              Row(
                children: [
                  DescriptionButton(spread, onSpreadChanged),
                  FavoriteButton(isFavorite, onFavoriteChanged),
                  Spacer(),
                  SaveButton(
                    onEmptyChanged: widget.onEmptyChanged,
                    filled: filled,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    isFavorite: isFavorite,
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
