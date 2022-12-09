import 'dart:io';

abstract class DotEnvService {
  static const String _filePath = '.env';
  static const String _lineDivider = '\n';
  static const String _keyValueDivider = '=';

  static final Map<String, String> _map = {};

  static void _init() {
    final File file = File(_filePath);
    final String text = file.readAsStringSync();

    for (String line in text.split(_lineDivider)) {
      final List<String> parts = line.split(_keyValueDivider);
      _map[parts[0]] = parts[1];
    }
  }

  static String? of(String key) {
    if (_map.isEmpty) {
      _init();
    }

    return _map[key];
  }

  String? operator [](String key) {
    return of(key);
  }
}
