import 'package:first_app/Utils/CustomPadding.dart';
import 'package:flutter/material.dart';

import '../utils/SizeUtils.dart';

class RatingHistoryRecordWidget extends StatefulWidget {

  String? contestName;
  int? rank;
  int? oldRating;
  int? newRating;
  Widget? icon;

  RatingHistoryRecordWidget({Key? key,
    required this.contestName,
    required this.rank,
    required this.oldRating,
    required this.newRating}) : super(key: key);

  @override
  State<RatingHistoryRecordWidget> createState() => _RatingHistoryRecordWidgetState();
}


class _RatingHistoryRecordWidgetState extends State<RatingHistoryRecordWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.black38),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(4, 8))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: <Widget>[
          CustomPadding().get(0, getHeight(0.01), 0, getHeight(0.01), Text("Contest: ${widget.contestName}")),
          CustomPadding().get(0, 0, 0, getHeight(0.005), Text("Your Rank: ${widget.rank}")),
          CustomPadding().get(0, 0, 0, getHeight(0.005), Text("Rating before contest: ${widget.oldRating}")),
          Text("Rating after contest: ${widget.newRating.toString()}"),
          getRatingChange(),
        ],
      ),
    );
  }

  // Add become pupil after getRatingChange line 45.
  // Add home page in menu and take care about loading data again.

  Widget getRatingChange() {
    var ratingChange = "";
    if(widget.newRating! > widget.oldRating!) {
      ratingChange = "+${widget.newRating! - widget.oldRating!}";
    }
    else if(widget.newRating! < widget.oldRating!) {
      ratingChange = "-${widget.oldRating! - widget.newRating!}";
    }
    else {
      ratingChange = "0";
    }

    return CustomPadding().get(0, getHeight(0.005), 0, getHeight(0.005), Text("Your rating change: $ratingChange"));
  }

  double getHeight(ratio) {
    return SizeUtils().getHeightRatio(context, ratio);
  }

  double getWidth(ratio) {
    return SizeUtils().getWidthRatio(context, ratio);
  }
}