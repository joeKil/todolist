import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
// extends HiveObject를 해야 하이브에 올라감
class Todo extends HiveObject {
  // 널로 해놓으면 라이브러리에서 자동으로 아이디를 구별함
  @HiveField(0)
  int? id;
  
  @HiveField(1)
  String title;
  
  @HiveField(2)
  // 숫자로 해놓고 변환해서 보여주기
  int dateTime;

  // 완료 체크
  @HiveField(3)
  bool isDone;

  Todo({
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });
}