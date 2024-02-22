import 'package:to_do/data/database_service.dart';
import 'package:to_do/domain/model/todo_item.dart';
import 'package:to_do/domain/model/todo_repository.dart';

class ToDoRepositoryImpl extends ToDORepository{

  DatabaseService database;
  ToDoRepositoryImpl(this.database);

  @override
  Future addItem(ToDoItem item) async {
    database.addItem(item);
  }

  @override
  Future deleteItem(ToDoItem item) async{
    database.deleteItem(item.id);
  }

  @override
  Future<List<ToDoItem>> getAllItems() async{
    return database.getAllItems();
  }
}