import 'package:flutter/material.dart';

class NoToDo extends StatelessWidget {
  const NoToDo(this.mainTitle);

  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/todo.webp'),
          ),
          Text(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            "아직 할 일이 없음",
          ),
          Text(
            style: TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.center,
            "할 일을 추가하고 $mainTitle 에서 \n 할 일을 추적하세요.",
          ),
        ],
      ),
    );
  }
}
