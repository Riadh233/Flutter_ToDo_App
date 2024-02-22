import 'package:to_do/domain/model/todo_item.dart';

abstract class ToDORepository {

  Future addItem(ToDoItem item);

  Future deleteItem(ToDoItem item);

  Future<List<ToDoItem>> getAllItems();
}
