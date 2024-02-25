import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/SizeUtils.dart';

class RatingHistoryRecordWidget extends StatefulWidget {
  final int? id;
  final String? contestName;
  final int? rank;
  final int? oldRating;
  final int? newRating;

  RatingHistoryRecordWidget({
    Key? key,
    required this.id,
    required this.contestName,
    required this.rank,
    required this.oldRating,
    required this.newRating,
  }) : super(key: key);

  @override
  State<RatingHistoryRecordWidget> createState() =>
      _RatingHistoryRecordWidgetState();
}

class _RatingHistoryRecordWidgetState
    extends State<RatingHistoryRecordWidget> {
  @override
  Widget build(BuildContext context) {
    final int ratingDifference = (widget.newRating ?? 0) - (widget.oldRating ?? 0);
    final Color differenceColor = ratingDifference > 0
        ? Colors.green
        : ratingDifference < 0
        ? Colors.red
        : Colors.black;

    return GestureDetector(
      onTap: () {
        var url = 'https://codeforces.com/contest/${widget.id}';
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
                    widget.contestName!,
                    style: TextStyle(
                      fontSize: SizeUtils().getHeight(context) * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Soft blue text color for the contest name
                    ),
                  ),
                  SizedBox(height: SizeUtils().getHeight(context) * 0.01),
                  Text(
                    "Your rank : ${widget.rank.toString()}",
                    style: TextStyle(
                      fontSize: SizeUtils().getHeight(context) * 0.02,
                      color: Colors.black87, // Dark gray text color for the start time
                    ),
                  ),
                  SizedBox(height: SizeUtils().getHeight(context) * 0.01),
                  Text(
                    "Old rating : ${widget.oldRating.toString()}",
                    style: TextStyle(
                      fontSize: SizeUtils().getHeight(context) * 0.02,
                      color: Colors.black87, // Dark gray text color for the start time
                    ),
                  ),
                  SizedBox(height: SizeUtils().getHeight(context) * 0.01),
                  Text(
                    "New rating : ${widget.newRating.toString()}",
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
                "Delta: ${ratingDifference.sign == -1 ? '' : '+'}$ratingDifference",
                style: TextStyle(
                  fontSize: SizeUtils().getHeight(context) * 0.018,
                  color: differenceColor, // Dark gray text color for the duration
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}