import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

import '../Utils/CustomPadding.dart';
import '../Utils/SizeUtils.dart';
import '../Utils/Utils.dart';

class ContestRecordWidget extends StatefulWidget {
  int? id;
  String? name;
  int? durationSeconds;
  int? startTime;

  ContestRecordWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.durationSeconds,
    required this.startTime,
  }) : super(key: key);

  @override
  State<ContestRecordWidget> createState() => _ContestRecordWidgetState();
}

class _ContestRecordWidgetState extends State<ContestRecordWidget> {
  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    int contestDurationInHours = widget.durationSeconds! ~/ 3600;
    int contestDurationInMinutes = (widget.durationSeconds! % 3600) ~/ 60;

    DateTime utcDateTime = DateTime.fromMillisecondsSinceEpoch(widget.startTime! * 1000, isUtc: true);

    String egyptTimeZone = 'Africa/Cairo';
    var egyptLocation = tz.getLocation(egyptTimeZone);
    var egyptTime = tz.TZDateTime.from(utcDateTime, egyptLocation);

    String formattedDate = DateFormat('dd/MM/yyyy hh:mm a').format(egyptTime);

    double screenWidth = SizeUtils().getWidth(context);

    return GestureDetector(
      onTap: () {
        var url = 'https://codeforces.com/contests/${widget.id}';
        Utils().openLink(url);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Utils().getHeight(0.02, context),
          horizontal: screenWidth < 600 ? Utils().getWidth(0.02, context) : Utils().getWidth(0.04, context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Utils().getHeight(0.02, context)),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(4, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomPadding().get(
              Utils().getWidth(0.02, context),
              Utils().getHeight(0.02, context),
              Utils().getWidth(0.02, context),
              Utils().getHeight(0.02, context),
              Text(
                "Contest id : ${widget.id}",
                style: TextStyle(fontSize: screenWidth < 600 ? Utils().getHeight(0.02, context) : Utils().getHeight(0.025, context), fontWeight: FontWeight.bold),
              ),
            ),
            CustomPadding().get(
              Utils().getWidth(0.02, context),
              0,
              Utils().getWidth(0.02, context),
              Utils().getHeight(0.02, context),
              Text("Contest name : ${widget.name}", style: TextStyle(fontSize: screenWidth < 600 ? Utils().getHeight(0.018, context) : Utils().getHeight(0.02, context))),
            ),
            CustomPadding().get(
              Utils().getWidth(0.02, context),
              0,
              Utils().getWidth(0.02, context),
              Utils().getHeight(0.02, context),
              Text(
                "Contest Duration: ${contestDurationInHours} hours${contestDurationInMinutes != 0 ? ' and ${contestDurationInMinutes} minutes' : ''}",
                style: TextStyle(fontSize: screenWidth < 600 ? Utils().getHeight(0.018, context) : Utils().getHeight(0.02, context)),
              ),
            ),
            CustomPadding().get(
              Utils().getWidth(0.02, context),
              0,
              Utils().getWidth(0.02, context),
              Utils().getHeight(0.02, context),
              Text("Contest start time : ${formattedDate}", style: TextStyle(fontSize: screenWidth < 600 ? Utils().getHeight(0.018, context) : Utils().getHeight(0.02, context))),
            ),
          ],
        ),
      ),
    );
  }
}
