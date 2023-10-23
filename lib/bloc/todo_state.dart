part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final List<Todo> todos;
  
  const TodoState({required this.todos});
  
  @override
  List<Object> get props => [todos];
}

/// initial state of [TodoBloc]
class TodoInitial extends TodoState {
  const TodoInitial({required super.todos});
}

/// loading state of [TodoBloc]
class TodoLoading extends TodoState {
  const TodoLoading({required super.todos});
}

/// loaded state of [TodoBloc]
class TodoLoaded extends TodoState {
  const TodoLoaded({required super.todos});
}
