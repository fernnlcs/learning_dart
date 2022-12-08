import 'package:learning_dart/src/features/user/user_resource.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get('/', (Request request) => Response.ok('Homepage')),
        Route.get('/login', (Request request) => Response.ok('Login')),
        Route.get('/register', (Request request) => Response.ok('Register')),
        Route.resource(
          UserResource(),
        ),
      ];
}