import 'package:app/models/feed.dart';
import 'package:app/models/session.dart';
import 'package:app/models/tweet.dart';
import 'package:app/pages/feed_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

import '.env.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: env['SUPABASE_API_URL']!,
    anonKey: env['SUPABASE_ANON_KEY']!,
  );
  await initGptTweets();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cs = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xff795548),
    );
    // var tt = Typography.englishLike2021;
    // var tt = Typography.blackCupertino;
    var tt = const TextTheme();
    return MultiProvider(
      providers: [
        Provider(create: (context) => Session()),
        // ChangeNotifierProvider(create: (context) => Heap(context.read<Supa>())),
      ],
      child: MaterialApp(
        title: 'Lantis',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: cs,
          // fontFamily: 'Inter',
          textTheme: tt,

          appBarTheme: AppBarTheme(
            backgroundColor: cs.surface,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: cs.surface,
              systemNavigationBarColor: cs.surface,
            ),
            elevation: 0.0,
          ),
          // textButtonTheme: TextButtonThemeData(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.green,
          //   ),
          // ),
          // elevatedButtonTheme: ElevatedButtonThemeData(
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.green,
          //     textStyle: tt.labelLarge,
          //   ),
          // ),
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => const SplashPage(),
          '/login': (_) => const LoginPage(),
          '/feed': (_) => FeedPage(data: FeedData.random()),
        },
      ),
    );
  }
}
