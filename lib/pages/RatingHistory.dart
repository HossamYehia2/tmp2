import '../Utils/ListDisplay.dart';
import '../Utils/NavBar.dart';
import 'package:flutter/material.dart';

import '../Variables.dart';
import '../objects/RatingHistoryRecord.dart';

class RatingHistory extends StatefulWidget {
  const RatingHistory({super.key});

  @override
  State<RatingHistory> createState() => _RatingHistoryState();
}

class _RatingHistoryState extends State<RatingHistory> {
  List<Object> ratingHistoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Rating history'),
      ),
      body: Center(
        child: getRatingHistory(),
      ),
    );
  }

  Widget getRatingHistory() {
    for (int i = 0; i < ratingHistoryResponseList.length; ++i) {
      var contest = ratingHistoryResponseList[i];
      ratingHistoryList.add(RatingHistoryRecordWidget(
          contestName: contest.contestName,
          rank: contest.rank,
          oldRating: contest.oldRating,
          newRating: contest.newRating,));
    }

    return ListDisplay(itemsList: ratingHistoryList);
  }
}
