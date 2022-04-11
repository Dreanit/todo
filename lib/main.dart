import 'package:flutter/material.dart';
import 'package:todo/UI/add_task.dart';
import 'package:todo/UI/welcome_screen.dart';
import 'package:todo/database/db_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  runApp(const ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: 'WelcomeScreen', routes: {
      'WelcomeScreen': (context) => const WelcomeScreen(),
      'AddTaskScreen': (context) => const AddTaskScreen(),

    });
  }
}
