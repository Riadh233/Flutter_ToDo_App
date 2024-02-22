import 'package:equatable/equatable.dart';

import '../../domain/model/todo_item.dart';

abstract class ToDoListState extends Equatable {
  final List<ToDoItem> items;

  const ToDoListState(this.items);

  @override
  List<Object?> get props => [items];
}

class InitialState extends ToDoListState {
  const InitialState({required List<ToDoItem> items}) : super(items);
}

class LoadedState extends ToDoListState {
  const LoadedState({required List<ToDoItem> items}) : super(items);
}
