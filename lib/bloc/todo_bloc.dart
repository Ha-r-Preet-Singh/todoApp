import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_bloc_app/database_provider/my_dbHelper.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todoData: [])) {
    on<AddTodoEvent>((event, emit) async {
      bool check = await MyDbHelper().addTodos(event.title);
      if (check) {
        emit(TodoState(todoData: await MyDbHelper().fetchAllTodos()));
      } else {
        print("Data Not Added");
      }
    });

    on<DeleteTodoEvent>((event, emit) async{
      bool check  = await MyDbHelper().deleteTodos(event.id);
      if(check){
        emit(TodoState(todoData: await MyDbHelper().fetchAllTodos()));
      }else{
        print("Data Not Deleted");
      }
    });


    on<getIntialDataEvent>((event, emit) async {

      emit(TodoState(todoData: await MyDbHelper().fetchAllTodos()));

    });




  }
}
