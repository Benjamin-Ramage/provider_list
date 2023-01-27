import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallback;

  const AddTaskScreen(
      this.addTaskCallback,
      {Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF161E27),
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.only(top: 20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  right: 20.0,
                  left: 20.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  onChanged: (newText){
                    newTaskTitle = newText;
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a new item to the list...'
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20.0,
                right: 20.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.addTaskCallback(newTaskTitle);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFF2f4961),
                  minimumSize: const Size(60.0, 60.0),
                  elevation: 10.0,
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(0xFF64cbfb),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
