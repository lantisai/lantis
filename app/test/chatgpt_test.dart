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
  test('EF `/tweets` returns something', () async {
    final resp = await supabase.functions.invoke("tweets");
    print(resp.data);
  });

  test('getGptTweets() returns something', () async {
    final tweets = await getGptTweets();
    print(tweets);
  });
}
