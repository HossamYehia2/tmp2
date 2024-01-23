import 'package:first_app/pages/ContestsPage.dart';
import 'package:first_app/pages/HacksPage.dart';

import 'ProfilePage.dart';
import 'package:flutter/material.dart';
import '../Variables.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static const routeName = '/startPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: StartPageWidget());
  }
}

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({Key? key}) : super(key: key);

  @override
  State<StartPageWidget> createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getTextField(),
          getTextButton(),
        ],
      ),
    );
  }

  Widget getTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter your handle',
      ),
      controller: myController,
    );
  }

  Widget getTextButton() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () => buttonAction(),
        child: const Text('Enter'));
  }

  void buttonAction() {
    // userName = myController.text.toString();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}
