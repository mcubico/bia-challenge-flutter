import 'package:flutter/material.dart';
import 'package:src/ui/screens/details.screen.dart';
import 'package:src/ui/screens/home.screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Movies Challenge',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'details': (context) => DetailsScreen()
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
