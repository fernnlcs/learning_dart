import 'package:learning_dart/src/core/services/dot_env/dot_env_service.dart';
import 'package:test/test.dart';

void main() {
  test('dot env service ...', () async {
    expect(DotEnvService.of('DATABASE_URL'),
        'postgres://username:password@localhost:5432/database');
  });
}
