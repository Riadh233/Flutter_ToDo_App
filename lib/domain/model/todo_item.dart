import 'package:hive/hive.dart';
part 'todo_item.g.dart';

@HiveType(typeId: 1)
class ToDoItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool completed;

  ToDoItem(this.id,this.title, this.completed);

  ToDoItem copyWith(String title,bool completed){
    return ToDoItem(id, title, completed);
  }

}
