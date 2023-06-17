import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/list_screen.dart';
import 'package:todolist/todo.dart';

// 늦게 값을 초기화 하겠다.
late final Box<Todo> todos;

void main() async {
  // 하이브 초기화는 여기에 해야함
  await Hive.initFlutter();
  // 하이브가 투두객체를 알 수 있게 해줘야함
  // Todo에 어노테이션 붙여놓은게 알아볼 수 있게 만들어주는데 터미널에 build명령어 입력해줘야함.
  // Todo 클래스 내용이 변경 될때마다 build명령어를 쳐줘야함

  // 어뎁터 등록을 해준다.
  Hive.registerAdapter(TodoAdapter());
  // DB를 박스라고 표현함. 투두 타입을 넣어줌.
  // todos라는 객체를 통해서 db에 접근 할 수 있음.
  // 위에 late를 써주고 todos가 먼저 실행된 후 앱이 실행되는 방법임. (왕초보전용)
  todos = await Hive.openBox<Todo>('todolist.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListScreen(),
    );
  }
}
