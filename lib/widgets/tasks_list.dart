import 'package:flutter/material.dart';
import 'package:provider_list/models/task.dart';
import 'package:provider_list/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList(this.tasks, {Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          longPressCallback: () {
            setState((){
              widget.tasks.removeAt(index);
            });
          },
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
