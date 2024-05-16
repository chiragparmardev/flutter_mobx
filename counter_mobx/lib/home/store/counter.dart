import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = CounterBase with _$Counter;
abstract class CounterBase with Store {
  @observable
   int number = 0;

  @action
  void increment(){
    number++;
  }

  @action
  void decrement(){
    number--;
  }
}

final Counter counter = Counter();