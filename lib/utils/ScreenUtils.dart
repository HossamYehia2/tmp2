import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenUtils {
  void showErrorMessageAndExit(context, String errorMessage) {
    Widget exitButton = TextButton(
      child: const Text("Exit"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content:
      Text(errorMessage),
      actions: [
        exitButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}