import 'package:first_app/Variables.dart';

import '../Utils/ListDisplay.dart';
import '../Utils/NavBar.dart';
import 'package:flutter/material.dart';

import '../objects/ContestRecord.dart';


class ContestsPage extends StatefulWidget {
  const ContestsPage({super.key});

  static const routeName = '/contestsPage';

  @override
  State<ContestsPage> createState() => _ContestsPageState();
}

class _ContestsPageState extends State<ContestsPage> {

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Finished'),
    Tab(text: 'Current'),
    Tab(text: 'Upcoming'),
  ];

  List<List<ContestRecordWidget>> contestCategories = [];

  _ContestsPageState() {
    contestCategories = [passedContestList, currentContestList, futureContestList];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.asMap().map((index, tab) {
            final String label = tab.text!.toLowerCase();
            return MapEntry(
              index,
              Center(
                child: ListDisplay(itemsList: contestCategories[index]),
              ),
            );
          }).values.toList(),
        ),
      ),
    );
  }
}