import 'package:consume/model/todo.dart';
import 'package:consume/service/todo_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late TodoService todoService;

  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  const endpoint = 'https://api.nstack.in/v1';

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
    todoService = TodoService(dio);
  });

  group("Get Todos Api", () {
    test("Should return a list of todos", () async {
      final List<Todo> todos = [
        Todo(
            id: "id1",
            title: 'Todo 1',
            description: "Description 1",
            isCompleted: true),
        Todo(id: "id2", title: 'Todo 2', description: "Description 2"),
      ];

      dioAdapter.onGet("$endpoint/todos?page=1&limit=10", (server) {
        return server.reply(200, {"items": todos});
      });

      final result = await todoService.findAll();

      expect(result.length, 2);
      expect(result.first.id, "id1");
    });

    test('Should throw ServerException when response code is other than 200',
        () async {
      dioAdapter.onGet("$endpoint/todos?page=1&limit=10", (server) {
        return server.throws(
            404,
            DioException(
                response: Response(
                    data: {"message": "something went wrong"},
                    requestOptions: RequestOptions()),
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                error: "",
                message: ""));
      });

      expect(() async => await todoService.findAll(),
          throwsA(isA<ServerException>()));
    });
  });
}
