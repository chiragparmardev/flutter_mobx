import 'package:counter_mobx/home/store/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DecrementScreen extends StatelessWidget {
  const DecrementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx Counter"),
      ),
      body: Center(
        child: Observer(builder: (context) => Text(counter.number.toString(),style: const TextStyle(
          fontSize: 30
        ),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.decrement();
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
