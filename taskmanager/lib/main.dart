import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/todo_home.dart';
import 'package:taskmanager/stores/todo_store.dart';
import 'package:taskmanager/values/appColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(    
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoHome()
    );
  }
}

TodoStore todo = TodoStore();
