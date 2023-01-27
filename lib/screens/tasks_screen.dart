
import 'package:flutter/material.dart';
import 'package:provider_list/models/task.dart';
import 'package:provider_list/screens/add_task_screen.dart';
import 'package:provider_list/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF57add4),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const Positioned(
            top: 350.0,
            child: Text(
              "Ben's ToDo List",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Color(0XFF2f4961),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            width: (MediaQuery
                .of(context)
                .size
                .width),
            child: Image.asset('images/ben.png'),
          ),
          Positioned(
            top: 420.0,
            child: Text(
              '${tasks.length} Tasks',
              style: const TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 18.0,
                color: Color(0XFF2f4961),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            width: (MediaQuery
                .of(context)
                .size
                .width),
            top: 460.0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0XFF2f4961),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: TasksList(tasks),
            ),
          ),
          Positioned(
            top: 815.0,
            left: 335.0,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 30.0,
                right: 20.0,
              ),
              child: ElevatedButton (
                onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                        child:Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AddTaskScreen(
                              (newTaskTitle){
                                setState((){
                                  tasks.add(Task(name: newTaskTitle));
                                });
                              }
                          ),
                        )
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: const Color(0xFF57add4),
                  minimumSize: const Size(60.0, 60.0),
                  elevation: 10.0,
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Color(0XFF2f4961),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
