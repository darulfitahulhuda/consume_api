// Mocks generated by Mockito 5.4.2 from annotations
// in consume/test/bloc/todo_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:consume/model/todo.dart' as _i3;
import 'package:consume/service/todo_service.dart' as _i4;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodo_1 extends _i1.SmartFake implements _i3.Todo {
  _FakeTodo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoServices extends _i1.Mock implements _i4.TodoService {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i5.Future<List<_i3.Todo>> findAll({
    int? page = 1,
    int? limit = 10,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #findAll,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
      ) as _i5.Future<List<_i3.Todo>>);
  @override
  _i5.Future<_i3.Todo> create(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [todo],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #create,
            [todo],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #create,
            [todo],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<bool> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<_i3.Todo?> update(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [todo],
        ),
        returnValue: _i5.Future<_i3.Todo?>.value(),
        returnValueForMissingStub: _i5.Future<_i3.Todo?>.value(),
      ) as _i5.Future<_i3.Todo?>);
}