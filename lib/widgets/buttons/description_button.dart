import 'package:flutter/material.dart';
import 'package:tasks/widgets/buttons/save_button.dart';

class DescriptionButton extends StatefulWidget {
  DescriptionButton(this.spread, this.onSpreadChanged);

  final bool spread;
  final void Function(bool spread) onSpreadChanged;

  @override
  State<DescriptionButton> createState() => _DescriptionButtonState();
}

class _DescriptionButtonState extends State<DescriptionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSpreadChanged(true),
      child: widget.spread
          ? SizedBox.shrink()
          : Icon(Icons.short_text_rounded, size: 24),
    );
  }
}

Widget DescriptionField(BuildContext context, onEmptyChanged) {
  return TextField(
    style: TextStyle(fontSize: 14),
    maxLines: 5,
    onSubmitted: (value) => saveToDo(context, onEmptyChanged),
    decoration: InputDecoration(hintText: '세부정보 추가'),
  );
}
