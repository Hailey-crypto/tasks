import 'package:flutter/material.dart';

class DoneButton extends StatefulWidget {
  const DoneButton(this.isDone, this.onDoneChanged, {super.key});

  final bool isDone;
  final void Function() onDoneChanged;

  @override
  State<DoneButton> createState() => _DoneButtonState();
}

class _DoneButtonState extends State<DoneButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.onDoneChanged(),
      icon: widget.isDone
          ? Icon(Icons.check_circle)
          : Icon(Icons.circle_outlined),
    );
  }
}
