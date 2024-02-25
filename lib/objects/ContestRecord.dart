import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

import '../Utils/SizeUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestRecordWidget extends StatefulWidget {
  final int? id;
  final String? name;
  final int? durationSeconds;
  final int? startTime;

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

    String formattedDate = DateFormat('MMM dd HH:mm').format(egyptTime).toUpperCase();

    return GestureDetector(
      onTap: () {
        var url = 'https://codeforces.com/contests/${widget.id}';
        Uri uri = Uri.parse(url);
        launchUrl(uri);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeUtils().getHeight(context) * 0.01,
          horizontal: SizeUtils().getWidth(context) * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300], // Light gray background color for the container
          borderRadius: BorderRadius.circular(SizeUtils().getHeight(context) * 0.02),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey, // Dark shade for shadow
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(SizeUtils().getHeight(context) * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name!,
                    style: TextStyle(
                      fontSize: SizeUtils().getHeight(context) * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Soft blue text color for the contest name
                    ),
                  ),
                  SizedBox(height: SizeUtils().getHeight(context) * 0.01),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: SizeUtils().getHeight(context) * 0.02,
                      color: Colors.black87, // Dark gray text color for the start time
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: SizeUtils().getHeight(context) * 0.02,
              right: SizeUtils().getWidth(context) * 0.04,
              child: Text(
                "${contestDurationInHours}h ${contestDurationInMinutes}m",
                style: TextStyle(
                  fontSize: SizeUtils().getHeight(context) * 0.018,
                  color: Colors.black87, // Dark gray text color for the duration
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}