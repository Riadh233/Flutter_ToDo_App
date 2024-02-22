
import 'package:hive/hive.dart';
import 'package:to_do/domain/model/todo_item.dart';

class DatabaseService{

  final String boxName = 'todo box';
  Future<Box<ToDoItem>> get _box async => await Hive.openBox(boxName);

  Future addItem(ToDoItem item) async{
    var box = await _box;
    box.put(item.id,item);
  }
  Future deleteItem(String id) async{
    var box = await _box;
    box.delete(id);

  }
  Future<List<ToDoItem>> getAllItems() async{
    var box = await _box;
    return box.values.toList();
  }

}
