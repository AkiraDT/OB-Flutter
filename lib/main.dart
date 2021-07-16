import 'package:daily_task/car_detail/car_detail_screen.dart';
import 'package:daily_task/car_list/car_list_screen.dart';
import 'package:daily_task/core/provider/theme_provider.dart';
import 'package:daily_task/main_home/main_home_screen.dart';
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
      theme: _theme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => MainHomeScreen(),
        '/cardetail': (context) => CarDetailScreen(),
        '/carList': (context) => CarListScreen(),
      },
    );
  }
}

