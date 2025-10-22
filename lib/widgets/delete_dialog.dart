import 'package:flutter/cupertino.dart';
import 'package:tasks/widgets/todo_view.dart';

deleteDialog(context, title, index, onDelete) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text('삭제 하시겠습니까?'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: false,
            onPressed: () => Navigator.pop(context),
            child: Text('취소'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => deleteToDo(context, index, onDelete),
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}

deleteToDo(context, index, onDelete) {
  list.removeAt(index);
  Navigator.pop(context);
  onDelete();
}
