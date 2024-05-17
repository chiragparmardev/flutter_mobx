import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskmanager/main.dart';
import 'package:taskmanager/values/appColor.dart';

class CheckList extends StatelessWidget {
  const CheckList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Checked Task',
            style: TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.deepPurple,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
       
        body: Observer(builder: (_) {
          return        
          todo.checkedList.isEmpty ? 
          Center(
            child: Image.asset('assets/images/noData.png',width: 200,height: 200,),
          ):
          ListView.builder(
              itemCount: todo.checkedList.length,
              itemBuilder: (context, index) {
                var item = todo.checkedList[index];
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
                                  : AppColor.red
                        ),
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
                  }));
                 
              });
        })
    );
  }
}