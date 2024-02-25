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
          vertical: 8,
          horizontal: _getWidthRatio(0.05),
        ),
        padding: EdgeInsets.symmetric(
          vertical: _getHeightRatio(0.012),
          horizontal: _getWidthRatio(0.02),
        ),
        decoration: BoxDecoration(
          color: Colors.blue.shade100, // Use your preferred color
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Use your preferred color
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildText("${widget.contestName}"),
            _buildText("Your Rank: ${widget.rank}"),
            _buildText("You Rate after contest: ${widget.oldRating}"),
            _buildText("You Rate before contest: ${widget.newRating}"),
            _buildText(
              "Delta: ${ratingDifference.sign == -1 ? '' : '+'}$ratingDifference",
              color: differenceColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, {Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: _getHeightRatio(0.002),
          horizontal: _getWidthRatio(0.02),
        ),
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            fontSize: _getWidthRatio(0.04),
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }

  void _launchContestUrl() async {
    var url = 'https://codeforces.com/contest/${widget.id}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print(url);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not launch contest URL')));
    }
  }

  double _getHeightRatio(double ratio) {
    return SizeUtils().getHeightRatio(context, ratio);
  }

  double _getWidthRatio(double ratio) {
    return SizeUtils().getWidthRatio(context, ratio);
  }
}