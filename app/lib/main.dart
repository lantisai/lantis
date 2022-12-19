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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cs = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xff795548),
    );
    var tt = Typography.englishLike2021.copyWith(
      displayLarge: Typography.englishLike2021.displayLarge
          ?.copyWith(color: Colors.black54),
      displayMedium: Typography.englishLike2021.displayMedium
          ?.copyWith(color: Colors.black54),
      displaySmall: Typography.englishLike2021.displaySmall
          ?.copyWith(color: Colors.black54),
      headlineLarge: Typography.englishLike2021.headlineLarge
          ?.copyWith(color: Colors.black54),
      headlineMedium: Typography.englishLike2021.headlineMedium
          ?.copyWith(color: Colors.black54),
      headlineSmall: Typography.englishLike2021.headlineSmall
          ?.copyWith(color: Colors.black87, fontSize: 22.0),
      titleLarge: Typography.englishLike2021.titleLarge
          ?.copyWith(color: Colors.black87, fontSize: 19.0),
      titleMedium: Typography.englishLike2021.titleMedium
          ?.copyWith(color: Colors.black87),
      titleSmall:
          Typography.englishLike2021.titleSmall?.copyWith(color: Colors.black),
      bodyLarge:
          Typography.englishLike2021.bodyLarge?.copyWith(color: Colors.black87),
      bodyMedium: Typography.englishLike2021.bodyMedium
          ?.copyWith(color: Colors.black87, fontSize: 16.0),
      bodySmall:
          Typography.englishLike2021.bodySmall?.copyWith(color: Colors.black54),
      labelLarge: Typography.englishLike2021.labelLarge
          ?.copyWith(color: Colors.black87),
      labelMedium:
          Typography.englishLike2021.labelMedium?.copyWith(color: Colors.black),
      labelSmall:
          Typography.englishLike2021.labelSmall?.copyWith(color: Colors.black),
    );
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
          '/feed': (_) => FeedPage(),
        },
      ),
    );
  }
}
