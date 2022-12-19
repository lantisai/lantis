import 'package:app/.env.dart';
import 'package:app/constants.dart';
import 'package:app/models/tweet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: env['SUPABASE_API_URL']!,
    anonKey: env['SUPABASE_ANON_KEY']!,
  );
  test('conn', () async {
    final resp =
        await supabase.from('tweets_full').select('*').is_('parent_id', null);
    print(resp);
  });
}
