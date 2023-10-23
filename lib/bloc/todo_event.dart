part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

/// load [Todo]
class TodoEventLoad extends TodoEvent {}

/// add new [Todo]
class TodoEventAdd extends TodoEvent {
  final Todo todo;

  const TodoEventAdd(this.todo);

  @override
  List<Object> get props => [todo];
}

/// update [Todo]
class TodoEventUpdate extends TodoEvent {
  final Todo todo;

  const TodoEventUpdate(this.todo);

  @override
  List<Object> get props => [todo];
}

/// delete [Todo]
class TodoEventDelete extends TodoEvent {
  final String id;

  const TodoEventDelete(this.id);

  @override
  List<Object> get props => [id];
}