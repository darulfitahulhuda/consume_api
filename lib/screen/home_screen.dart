import 'package:consume/model/todo.dart';
import 'package:consume/screen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import 'create_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TodoLoaded) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text('No data'),
              );
            }

            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.note),
                  title: Text(state.todos[index].title),
                  subtitle: Text(
                    state.todos[index].description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateScreen(
                                todo: Todo(
                                  id: state.todos[index].id,
                                  title: state.todos[index].title,
                                  description: state.todos[index].description,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(TodoEventDelete(state.todos[index].id));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
