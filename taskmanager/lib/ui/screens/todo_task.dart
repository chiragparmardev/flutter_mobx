// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/main.dart';
import 'package:taskmanager/models/todo_model.dart';
import 'package:taskmanager/values/appColor.dart';

class TodoTask extends StatefulWidget {
  final int? taskIndex;
  const TodoTask({super.key, this.taskIndex});

  @override
  State<TodoTask> createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  String dropdownValue = 'Low';

  var priorityList = ["Low", "Medium", "High"];

  @override
  void initState() {
    if (widget.taskIndex != null) {
      titleController.text = todo.todoList[widget.taskIndex!].title;
      dateController.text = todo.todoList[widget.taskIndex!].date;
      dropdownValue = todo.todoList[widget.taskIndex!].priority;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.taskIndex != null ?'Edit Task' : 'Add Task',
          style: const TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.deepPurple,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  titleController.text = value;
                },
                textInputAction: TextInputAction.next,
                controller: titleController,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Enter the title',
                    filled: true,
                    fillColor: AppColor.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                    hintText: 'Pick the date',
                    filled: true,
                    fillColor: AppColor.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onChanged: (value) {
                  dateController.text = value;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await datePicker(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                validator: (value) =>
                    value == null ? 'Pick the priority' : null,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                borderRadius: BorderRadius.circular(20),
                elevation: 5,
                isExpanded: true,
                items: priorityList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                value: dropdownValue,
                onChanged: (val) {
                  dropdownValue = val!;
                },
                hint: const Text('Pick the priority'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      widget.taskIndex != null
                          ? todo.editTodo(
                              widget.taskIndex!,
                              titleController.text,
                              dateController.text,
                              dropdownValue)
                          : todo.addTodo(TodoModel(
                              title: titleController.text,
                              date: dateController.text,
                              priority: dropdownValue,
                              checked: false));
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Text(
                    widget.taskIndex != null ? 'Edit' : 'Add Task',
                    style: const TextStyle(
                      color: AppColor.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 1),
        lastDate: DateTime.now(),
        builder: (context, picker) {
          return picker!;
        }).then((selectedDate) {
      if (selectedDate != null) {
        dateController.text = DateFormat('dd:MM:yy').format(selectedDate);
      }
      return null;
    });
  }
}
