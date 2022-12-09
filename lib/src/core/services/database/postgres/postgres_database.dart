import 'dart:async';

import 'package:learning_dart/src/core/services/database/remote_database.dart';
import 'package:learning_dart/src/core/services/dot_env/dot_env_service.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';

class PostgresDatabase implements RemoteDatabase, Disposable {
  final Completer<PostgreSQLConnection> completer = Completer();

  PostgresDatabase() {
    _init();
  }

  void _init() async {
    final String? url = DotEnvService.of('DATABASE_URL');
    final Uri uri = Uri.parse(url ?? "");

    PostgreSQLConnection connection = PostgreSQLConnection(
      uri.host,
      uri.port,
      uri.pathSegments.first,
      username: uri.userInfo.split(':').first,
      password: uri.userInfo.split(':').last,
    );
    await connection.open();
    completer.complete(connection);
  }

  @override
  Future<List<Map<String, Map<String, dynamic>>>> query(
    String queryText, {
    Map<String, String> variables = const {},
  }) async {
    final PostgreSQLConnection connection = await completer.future;

    return connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  void dispose() async {
    final PostgreSQLConnection connection = await completer.future;
    await connection.close();
  }
}
