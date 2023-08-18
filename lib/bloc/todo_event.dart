part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}


class AddTodoEvent extends TodoEvent {


  String title;
  int id;


  AddTodoEvent({
    required this.title,
    required  this.id,
});
}

class DeleteTodoEvent extends TodoEvent {
  int id;


  DeleteTodoEvent({
    required this.id,
});
}

class getIntialDataEvent extends TodoEvent {}