import 'dart:convert';
import 'dart:math';

final Random _random = Random.secure();

String randomString(int length) {
  var values = List<int>.generate(length, (i) => _random.nextInt(256));

  return base64Url.encode(values);
}

int randomInt(int min, int max) {
  return _random.nextInt(max - min) + min;
}

T choice<T>(List<T> args) {
  final index = _random.nextInt(args.length);
  return args[index];
}
