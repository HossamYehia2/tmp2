import 'package:flutter/material.dart';
import 'ProfilePage.dart'; // Ensure this import is correct for your project structure

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static const routeName = '/startPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 600),
          child: const StartPageWidget(),
        ),
      ),
    );
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getTextField(constraints),
              SizedBox(height: 20),
              getElevatedButton(context), // Pass context to use in buttonAction
            ],
          ),
        );
      },
    );
  }

  Widget getTextField(BoxConstraints constraints) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter your handle',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      controller: myController,
    );
  }

  Widget getElevatedButton(BuildContext context) {
    // Updated to use buttonAction
    return ElevatedButton(
      onPressed: () => buttonAction(context), // Use buttonAction here
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Button color
        onPrimary: Colors.white, // Text color
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text('Enter'),
    );
  }

  void buttonAction(BuildContext context) {
    // Navigate to ProfilePage
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}