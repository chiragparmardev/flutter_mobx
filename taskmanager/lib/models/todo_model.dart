import 'package:mobx/mobx.dart';

part 'todo_model.g.dart';

class TodoModel = _TodoModel with _$TodoModel;

abstract class _TodoModel with Store{
  @observable
  String title;

  @observable
  String date;

  @observable 
  String priority;

  @observable
  bool checked = false;

  _TodoModel({required this.title,required this.date,required this.priority,required this.checked});
}