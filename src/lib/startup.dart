import 'package:flutter/material.dart';

import 'pages/finish_page/finish_page.dart';
import 'pages/game_page/game_page.dart';
import 'pages/help_page/help_page.dart';
import 'pages/menu_page/menu_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programmers Sudoku',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,

        // Define the default font family.
        fontFamily: "nidsans",

        scaffoldBackgroundColor: Colors.orange[50],

        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 20.0),
          bodyText2: TextStyle(fontSize: 18.0),
          button: TextStyle(fontSize: 18.0),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MenuPage(),
        "/help": (context) => const HelpPage(),
        "/finish": (context) => const FinishPage(),
        "/game": (context) => const GamePage(),
      },
    );
  }
}
