// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:consume/model/todo.dart';

class TodoService {
  final _endpoint = 'https://api.nstack.in/v1';
  final Dio dio;
  TodoService(
    this.dio,
  );

  /// find all [Todo]
  /// [findAll] method will return list of [Todo]
  Future<List<Todo>> findAll({int page = 1, int limit = 10}) async {
    final result = <Todo>[];

    try {
      final response =
          await dio.get('$_endpoint/todos?page=$page&limit=$limit');

      response.data['items'].forEach((v) {
        result.add(Todo.fromJson(v));
      });
      return result;
    } on DioException catch (e) {
      throw ServerException(message: e.response?.statusMessage ?? "");
    }
  }

  /// create new [Todo]
  /// [create] method will return [Todo]
  Future<Todo> create(Todo todo) async {
    try {
      final response = await dio.post('$_endpoint/todos', data: todo.toJson());

      return Todo.fromJson(response.data['data']);
    } catch (e) {
      print(e);
    }

    return todo;
  }

  /// delete [Todo] by id
  /// [delete] method will return [bool]
  Future<bool> delete(String id) async {
    try {
      await dio.delete('$_endpoint/todos/$id');

      return true;
    } catch (e) {
      return false;
    }
  }

  /// update [Todo]
  /// [update] method will return [Todo]
  Future<Todo?> update(Todo todo) async {
    try {
      await dio.put('$_endpoint/todos/${todo.id}', data: todo.toJson());

      return todo;
    } catch (e) {
      return null;
    }
  }
}

class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}
