import 'package:bloc_test/bloc_test.dart';
import 'package:consume/bloc/todo_bloc.dart';
import 'package:consume/model/todo.dart';
import 'package:consume/service/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoService>(as: #MockTodoServices)])
void main() {
  late TodoService todoService;
  late TodoBloc todoBloc;

  setUp(() {
    todoService = MockTodoServices();
    todoBloc = TodoBloc(todoService);
  });

  final List<Todo> todos = [
    Todo(
        id: "id1",
        title: 'Todo 1',
        description: "Description 1",
        isCompleted: true),
    Todo(id: "id2", title: 'Todo 2', description: "Description 2"),
  ];

  blocTest<TodoBloc, TodoState>(
    "When TodoBloc event TodoEventLoad",
    setUp: () {
      when(todoService.findAll()).thenAnswer((_) async => todos);
    },
    verify: (bloc) => verify(todoService.findAll()),
    build: () => todoBloc,
    act: (bloc) => bloc.add(TodoEventLoad()),
    expect: () => [
      isA<TodoLoading>(),
      isA<TodoLoaded>(),
    ],
  );
}
