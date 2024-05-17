import 'package:mobx/mobx.dart';
import 'package:taskmanager/models/todo_model.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;
abstract class _TodoStore with Store{
  @observable
  ObservableList<TodoModel> todoList = ObservableList<TodoModel>();

  @action
  void addTodo(TodoModel todo) {
    todoList.add(todo);
  }

  @action
  void deleteTodo(index){
    todoList.removeAt(index);
  }

  @action
  void editTodo(index,title,date,priority){
    todoList[index] = TodoModel(title: title, date: date, priority: priority,checked: false);
  }

  @computed
  ObservableList<TodoModel> get checkedList => ObservableList.of(todoList.where((data) => data.checked));
}