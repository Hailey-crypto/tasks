import 'package:flutter/material.dart';
import 'package:tasks/widgets/buttons/save_button.dart';

class DescriptionButton extends StatefulWidget {
  const DescriptionButton(this.spread, this.onSpreadChanged, {super.key});

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

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required this.context,
    required this.onEmptyChanged,
    required this.titleController,
    required this.descriptionController,
    required this.isFavorite,
  });

  final BuildContext context;
  final void Function(bool) onEmptyChanged;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      style: TextStyle(fontSize: 14),
      maxLines: 5,
      onSubmitted: (value) => saveToDo(
        context: context,
        onEmptyChanged: onEmptyChanged,
        titleController: titleController,
        descriptionController: descriptionController,
        isFavorite: isFavorite,
      ),
      decoration: InputDecoration(hintText: '세부정보 추가'),
    );
  }
}
