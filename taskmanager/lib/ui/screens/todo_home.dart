import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskmanager/ui/screens/check_list.dart';
import 'package:taskmanager/ui/screens/todo_task.dart';
import 'package:taskmanager/main.dart';
import 'package:taskmanager/values/appColor.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task Manager',
            style: TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.deepPurple,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CheckList()));
                },
                icon: const Icon(
                  Icons.check_circle,
                  color: AppColor.white,
                  size: 25,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TodoTask()));
          },
          backgroundColor: AppColor.deepPurple,
          child: const Icon(
            Icons.add,
            color: AppColor.white,
          ),
        ),
        body: Observer(builder: (_) {
          return todo.todoList.isEmpty
              ? Center(
                  child: Image.asset(
                    'assets/images/noData.png',
                    width: 200,
                    height: 200,
                  ),
                )
              : ListView.builder(
                  itemCount: todo.todoList.length,
                  itemBuilder: (context, index) {
                    var item = todo.todoList[index];
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Row(
                        children: [
                          Text(
                            item.priority,
                            style: TextStyle(
                                fontSize: 15,
                                color: item.priority.toString() == 'Low'
                                    ? AppColor.green
                                    : item.priority.toString() == 'Medium'
                                        ? AppColor.yellow
                                        : AppColor.red),
                          ),
                          const Spacer(),
                          Text(item.date),
                        ],
                      ),
                      leading: Observer(builder: (_) {
                        return Checkbox(
                            value: item.checked,
                            onChanged: (value) {
                              item.checked = !item.checked;
                            });
                      }),
                      trailing: IconButton(
                          onPressed: () {
                            todo.deleteTodo(index);
                          },
                          icon: const Icon(Icons.delete)),
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoTask(
                                      taskIndex: index,
                                    )));
                      },
                    );
                  });
        }));
  }
}
