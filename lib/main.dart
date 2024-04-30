import 'package:flutter/material.dart';
import 'package:untitled/screens/fifth_screen.dart';
import 'package:untitled/screens/first_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/screens/fourth_screen.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:untitled/screens/zero_screen.dart';

void main() {
  runApp(const MyApp(title: '',));
}
class Crossplatformer {
  bool whatIsThatInterface() {
    if (kIsWeb) {
      return true;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux || Platform.isMacOS || Platform.isAndroid || Platform.isFuchsia);
    return false;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.title});  final String title;  @override  State<MyApp> createState() => _MyAppState();}
class _MyAppState extends State<MyApp> {

  Crossplatformer pl = Crossplatformer();

  final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const FirstScreen(title: '');
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'first_screen',
              builder: (BuildContext context, GoRouterState state) {
                return const FirstScreen(title: '',);
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'fourth_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return const FourthScreen(title: '',);
                  },
                ),
              ],
            ),
          ],
        )]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ZeroScreen(title: '',),
    );
  }
}
