import 'package:counter_mobx/home/decrement.dart';
import 'package:counter_mobx/home/store/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class IncrementScreen extends StatelessWidget {
  const IncrementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Mobx Counter"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DecrementScreen()));
          }, icon: const Icon(Icons.forward))
        ],
      ),
      body: Center(
        child: Observer(
          builder: (context) => 
          Text(counter.number.toString(),style: const TextStyle(
          fontSize: 30
        ),)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
          counter.increment();
    },child: const Icon(Icons.add),),
    );
  }
}