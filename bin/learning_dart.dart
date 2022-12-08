import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  final HttpServer server = await shelf_io.serve(
      (request) => Response(200, body: "ok"), "localhost", 8080);

  print("Server initialized in http://localhost:8080");
}
