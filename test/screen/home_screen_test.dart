import 'package:bloc_test/bloc_test.dart';
import 'package:consume/bloc/todo_bloc.dart';
import 'package:consume/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTodoBloc extends MockBloc<TodoEvent, TodoState> implements TodoBloc {}

void main() {
  late TodoBloc todoBloc;

  setUp(() {
    todoBloc = MockTodoBloc();

    whenListen<TodoState>(
        todoBloc,
        Stream.fromIterable(
            [const TodoInitial(todos: []), const TodoLoading(todos: [])]),
        initialState: const TodoInitial(todos: []));
  });

  testWidgets("page should display progress indicator bar", (tester) async {
    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);
    final scaffoldFinder = find.byType(Scaffold);

    await tester.pumpWidget(BlocProvider(
        create: (_) => todoBloc, child: const MaterialApp(home: HomeScreen())));

    expect(centerFinder, findsWidgets);
    expect(progressFinder, findsWidgets);
    expect(scaffoldFinder, findsOneWidget);
  });
}
