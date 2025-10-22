import 'package:flutter/material.dart' hide BottomSheet;
import 'package:tasks/widgets/bottom_sheet.dart';

class AddToDo extends StatelessWidget {
  AddToDo(this.empty, this.onEmptyChanged);

  final bool empty;
  final void Function(bool empty) onEmptyChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => addToDo(context, empty, onEmptyChanged),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

addToDo(context, empty, onEmptyChanged) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => BottomSheet(empty, onEmptyChanged),
  );
}

/*
widgets
- bottom_sheet ) BottomSheet
*/
