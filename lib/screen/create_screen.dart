import 'package:consume/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo.dart';

class CreateScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<TodoBloc>().add(
                        TodoEventAdd(
                          Todo(
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        ),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
