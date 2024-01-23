import 'package:first_app/pages/ContestsPage.dart';
import 'package:first_app/pages/HacksPage.dart';
import 'package:first_app/pages/ProfilePage.dart';
import 'package:first_app/pages/RatingHistory.dart';

import 'pages/StartPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        RatingHistory.routeName: (context) => const RatingHistory(),
        ContestsPage.routeName: (context) => const ContestsPage(),
        HacksPage.routeName: (context) => const HacksPage(),
      },
    );
  }
}
