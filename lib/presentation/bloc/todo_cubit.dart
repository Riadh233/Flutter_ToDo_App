
import 'package:bloc/bloc.dart';
import 'package:to_do/domain/model/todo_item.dart';
import 'package:to_do/domain/model/todo_repository.dart';
import 'package:to_do/presentation/bloc/todo_state.dart';

class ToDoListCubit extends Cubit<ToDoListState> {
  final ToDORepository repository;

  ToDoListCubit({required this.repository})
      : super(const InitialState(items:[])){
    getAllItems();
  }

  void addItem(ToDoItem item) async {
    await repository.addItem(item);
    var items = await repository.getAllItems();
    emit(LoadedState(items: items));
  }

  void deleteItem(ToDoItem item) async {
    await repository.deleteItem(item);
    var items = await repository.getAllItems();
    emit(LoadedState(items: items));
  }

  void updateItem(ToDoItem item) async {
    await repository.addItem(item);
    var items = await repository.getAllItems();
    emit(LoadedState(items: items));
  }

  void getAllItems() async {
    var items = await repository.getAllItems();
    emit(LoadedState(items: items));
  }
}
