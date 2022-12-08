import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  final HttpServer server = await io.serve(_handler, '0.0.0.0', 4466);
  print('Online at ${server.address.address}:${server.port}');
}

FutureOr<Response> _handler(Request request) {
  print(request);
  return Response(200, body: "Body");
}
