import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool taskComplete;
  final String taskName;
  Function(bool?)? onChange;
  Function(BuildContext) onDelete;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 8),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ]),
          child: Container(
            padding:
                const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 214, 90),
                borderRadius: BorderRadius.circular(15)),
            child: Row(children: [
              Checkbox(value: taskComplete, onChanged: onChange),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 16,
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ]),
          ),
        ));
  }
}
