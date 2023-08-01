import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_finder/router/app_router.dart';
import 'package:marvel_finder/ui/providers/the-movies-db/providers.dart';
import 'package:provider/provider.dart';

import 'ui/providers/marvel/providers.dart';

Future main() async {
  await dotenv.load(fileName: 'assets/env/.env');
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => CharactersProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => ComicsProvider(),
          lazy: true,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Movies Challenge',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.indigo),
      ),
    );
  }
}
