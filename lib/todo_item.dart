import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  // 콜백
  final Function(Todo) onTap;

  // 콜백
  final Function(Todo) onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.check_circle_outline),
      title: Text(todo.title,
          // 완료되면 폰트 연하게 바꿔주기.
          style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black)),
      subtitle: Text(
        // DB에 데이트타임 넣으면 안됨. 숫자나글자나 그런것들이 들어갈 수 있어서 안됨.
        DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(todo.dateTime)),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever),
            )
          : null,
    );
  }
}
