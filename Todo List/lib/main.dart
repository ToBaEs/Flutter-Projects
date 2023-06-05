import 'package:flutter/material.dart';
import 'package:project/models/todo.dart';
import 'package:project/screens/todolist.dart';
import 'package:project/screens/todolistModel2.dart';
import 'package:project/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "Home",
      debugShowCheckedModeBanner: false,
      home: const TodoListModel(),
      routes: {
        //"Welcome": (context) => Welcome(),
        "Home": (context) => TodoListModel(),
        "Welcome": (context) => Welcome(),
        "todolist": (context) => TodoList(),
      },
    );
  }
}
