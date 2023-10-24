import 'dart:async';

import 'package:learning_dart/src/core/services/database/remote_database.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class UserResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/user', _getAllUsers),
        Route.get('/user/:id', _getUserById),
        Route.post('/user', _createUser),
        Route.put('/user', _updateUser),
        Route.delete('/user', _deleteUser),
      ];

  FutureOr<Response> _getAllUsers(Injector injector) async {
    final RemoteDatabase database = injector.get<RemoteDatabase>();
    final List<Map<String, Map<String, dynamic>>> result =
        await database.query('SELECT id, name, email, role from "User"');
        
    return Response.ok('All users');
  }

  FutureOr<Response> _getUserById(ModularArguments arguments) {
    return Response.ok('User ${arguments.params['id']}');
  }

  FutureOr<Response> _createUser(ModularArguments arguments) {
    return Response.ok('Created user ${arguments.data}');
  }

  FutureOr<Response> _updateUser(ModularArguments arguments) {
    return Response.ok('Updated user ${arguments.data}');
  }

  FutureOr<Response> _deleteUser(ModularArguments arguments) {
    return Response.ok('Deleted user ${arguments.params['id']}');
  }
}
