import 'package:flutter/material.dart';
import 'package:provider_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:provider_list/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              // taskTitle: taskData.tasks[index].name,
              taskTitle: task.name,
              // isChecked: taskData.tasks[index].isDone,
              isChecked: task.isDone,
              longPressCallback: () {
                // taskData.removeTask(taskData.tasks[index]);
                taskData.removeTask(task);
              },
              checkboxCallback: (checkboxState) {
                // taskData.updateTask(taskData.tasks[index]);
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
