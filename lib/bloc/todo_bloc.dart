import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/todo.dart';
import '../service/todo_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  // final todoService = TodoService(Dio());
  final TodoService todoService;

  TodoBloc(this.todoService) : super(const TodoInitial(todos: [])) {
    on<TodoEventLoad>((event, emit) async {
      emit(TodoLoading(todos: [...state.todos]));
      final todos = await todoService.findAll();

      emit(TodoLoaded(todos: [...todos]));
    });

    on<TodoEventAdd>((event, emit) async {
      emit(TodoLoading(todos: [...state.todos]));
      final todo = await todoService.create(event.todo);

      emit(TodoLoaded(todos: [...state.todos, todo]));
    });

    on<TodoEventUpdate>((event, emit) async {
      emit(TodoLoading(todos: [...state.todos]));
      final todo = await todoService.update(event.todo);

      if (todo == null) {
        return;
      }

      final todos = state.todos.map((e) => e.id == todo.id ? todo : e).toList();

      emit(TodoLoaded(todos: [...todos]));
    });

    on<TodoEventDelete>((event, emit) async {
      emit(TodoLoading(todos: [...state.todos]));
      await todoService.delete(event.id);

      final todos = state.todos.where((e) => e.id != event.id).toList();

      emit(TodoLoaded(todos: [...todos]));
    });
  }
}
