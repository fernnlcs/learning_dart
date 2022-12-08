import 'dart:io';

import 'package:learning_dart/learning_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  final Handler handler = await startShelfModular();
  final HttpServer server = await io.serve(handler, '0.0.0.0', 4466);
  print('Server online at ${server.address.address}:${server.port}');
}
