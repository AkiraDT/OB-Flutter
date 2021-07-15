import 'package:daily_task/MainHome/DetailActivity.dart';
import 'package:daily_task/MainHome/MainHomeActivity.dart';
import 'package:daily_task/core/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp(), ));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _theme = watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainHomeActivity(),
      theme: _theme,
      // initialRoute: '/home',
      routes: {
        '/home': (context) => MainHomeActivity(),
        '/detail': (context) => DetailActivity()
      },
    );
  }
}

