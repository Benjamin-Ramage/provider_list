import 'package:flutter/material.dart';
import 'package:provider_list/screens/tasks_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      title: "Ben's ToDo List",
      home: const TasksScreen(),
    );
  }
}