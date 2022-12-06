import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final keys = [
    'SUPABASE_API_URL',
    'SUPABASE_ANON_KEY',
  ];
  final config = Map.fromEntries(
      keys.map((key) => MapEntry(key, Platform.environment[key])));

  const filename = 'lib/.env.dart';
  File(filename).writeAsString('final env = ${json.encode(config)};');
}
