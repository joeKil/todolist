import 'package:flutter/material.dart';
import 'package:todolist/create_screen.dart';
import 'package:todolist/main.dart';
import 'package:todolist/todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
        // main에 있는 데이터베이스 접근 / values로 접근. 값을 가지고와서 접근.
        // 여기까지하면 DB에 있는 데이터가 보이도록 한거임.
        children: todos.values
            .map((e) => TodoItem(
                  todo: e,
                  onTap: (todo) async {
                    todo.isDone = !todo.isDone;
                    // 하이브에서 제공함. 세이브가 간편해짐.
                    await todo.save();

                    // 세이브가 끝나면 갱신
                    setState(() {});
                  },
                  onDelete: (todo) {
                    // 삭제 하이브에서 제공
                    todo.delete();

                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 네비게이터 퓨처타입임. 나올 때까지 기다리게끔 만들어줘야함.
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          // 갔다가 오면 화면 갱신
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
