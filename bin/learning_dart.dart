import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  Pipeline pipeline = Pipeline().addMiddleware(log());

  final HttpServer server =
      await io.serve(pipeline.addHandler(_handler), '0.0.0.0', 4466);

  print('Online at ${server.address.address}:${server.port}');
}

Middleware log() {
  return (Handler handler) {
    return (Request request) async {
      // Before running
      print('Requested: ${request.url}');

      Response response = await handler(request);

      // After running
      print('Response: ${response.statusCode}');
      return response;
    };
  };
}

FutureOr<Response> _handler(Request request) {
  print(request);
  return Response(200, body: "Body");
}
