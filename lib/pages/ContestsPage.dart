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
    Tab(text: 'Finished Contests'),
    Tab(text: 'Current Contests'),
    Tab(text: 'Upcoming Contests'),
  ];

  List<List<ContestRecordWidget>> contestCategories = [];

  _ContestsPageState() {
    prepareContestsData();
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

  void prepareContestsData() {

    print("Hello from prepare");

    List<ContestRecordWidget> list1 = [
      ContestRecordWidget(id: 1, name: 'a', durationSeconds: 30, startTime: 2,),
      ContestRecordWidget(id: 1, name: 'b', durationSeconds: 30, startTime: 2,),
    ];

    List<ContestRecordWidget> list2 = [
      ContestRecordWidget(id: 1, name: 'c', durationSeconds: 30, startTime: 2,),    ];

    List<ContestRecordWidget> list3 = [
      ContestRecordWidget(id: 1, name: 'd', durationSeconds: 30, startTime: 2,),    ];

    contestCategories = [passedContestList, currentContestList, futureContestList];
  }
}