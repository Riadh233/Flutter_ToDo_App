import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/domain/model/todo_item.dart';
import 'package:to_do/presentation/bloc/todo_cubit.dart';
import 'package:to_do/presentation/bloc/todo_state.dart';
import 'package:to_do/presentation/widgets/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListCubit, ToDoListState>(
      builder: (BuildContext context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Hive ToDo App"),
              backgroundColor: Colors.blue,
              elevation: 6,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                showAlertDialogue(context, null, 'Add Task');
              },
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (_, index) {
                    var item = state.items[index];
                    return ToDoWidget(
                        item: item,
                        onRemove: (item) => {
                              context.read<ToDoListCubit>().deleteItem(item),
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Task titled ${item.title} deleted")))
                            },
                        onComplete: (item) => context
                            .read<ToDoListCubit>()
                            .updateItem(
                                item.copyWith(item.title, !item.completed)),
                        onItemTap: (item) {
                          _textController.text = item.title;
                          showAlertDialogue(context, item, 'Update Task');
                        });
                  }),
            ));
      },
    );
  }

  void showAlertDialogue(BuildContext context, ToDoItem? item, String type) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(type),
            content: TextField(
              controller: _textController,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (item == null) {
                    context.read<ToDoListCubit>().addItem(ToDoItem(
                        DateTime.now().toString(),
                        _textController.text,
                        false));
                  } else {
                    context.read<ToDoListCubit>().updateItem(
                        item.copyWith(_textController.text, item.completed));
                  }
                  //create task
                  Navigator.of(context).pop(null);
                  _textController.clear();
                },
                child: Text(type),
              )
            ],
          );
        });
  }
}
