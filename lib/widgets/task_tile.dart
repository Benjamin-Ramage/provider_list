import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  const TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF64cbfb),
          fontWeight: FontWeight.bold,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      //We added named parameters in the TaskCheckbox for specificity.
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        // onChanged: toggleCheckboxState,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
