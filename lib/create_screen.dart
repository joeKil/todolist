import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 작성'),
        actions: [
          IconButton(
            // 끝나고 뒤로가는 타이밍을 맞춰주고 싶으면 await을 쓰면됨.
            onPressed: () async {
              // 오래걸릴거같으면 로딩처리 해주면되는데. 여기선 안함.
              await todos.add(Todo(
                title: _textController.text,
                // microsecondsSinceEpoch이거 쓰면 인트값으로 변환된 값을 얻을 수 있음.
                dateTime: DateTime.now().microsecondsSinceEpoch,
              ));
              // 추가 후 뒤로가기. 추가된 데이터 보여주고
              // async안에서 네비게이터를 사용할 때는 컨텍스트가 사용 가능한지 확인해야함.
              // 예를 들어 작성하는 도중에 뒤로가기 눌러버렸을 때 에러가 발생할 수 있음. 방지하는 코드 if
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          // 텍스트 필드에서 작동하는 값들은 컨트롤러를 통해서 얻을 수 있음.
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // 여러 단계 그레이를 확인할 수 있는데 100은 별로 안보임
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: '할일을 입력하세요',
            // 상자안 색 바꾸기
            // filled true를 해줘야함.
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
