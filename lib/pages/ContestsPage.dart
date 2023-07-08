import '../Utils/NavBar.dart';
import 'package:flutter/material.dart';

class ContestsPage extends StatelessWidget {
  const ContestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Contests page'),
      ),
      body: const Center(
        child: Center(
          child: Text('Start contests page'),
        ),
      ),
    );
  }
}