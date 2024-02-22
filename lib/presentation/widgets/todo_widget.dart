import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/model/todo_item.dart';

class ToDoWidget extends StatelessWidget {
  final ToDoItem item;
  final void Function(ToDoItem item) onRemove;
  final void Function(ToDoItem item) onComplete;
  final void Function(ToDoItem item) onItemTap;

  const ToDoWidget(
      {super.key,
      required this.item,
      required this.onRemove,
      required this.onComplete,
      required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
                label: 'Delete',
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                onPressed: (context) {
                  onRemove(item);
                })
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
                label: 'Delete',
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                onPressed: (context) {
                  onRemove(item);
                })
          ],
        ),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: ListTile(
              leading: Text(
                item.title,
                style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4)
                    .copyWith(
                        decoration: item.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
              ),
              trailing: Checkbox(
                value: item.completed,
                onChanged: (isCompleted) =>
                    {onComplete(item.copyWith(item.title, !isCompleted!))},
              ),
              onTap: () {
                onItemTap(item);
              },
            ),
          ),
        ),
      ),
    );
  }
}
