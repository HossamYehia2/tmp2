import 'package:first_app/Utils/CustomPadding.dart';
import 'package:flutter/material.dart';

import '../utils/Utils.dart';

class HackRecordWidget extends StatefulWidget {

  String? problemName;
  String? hacker;
  String? defender;
  String? verdict;

  HackRecordWidget({Key? key,
    required this.problemName,
    required this.hacker,
    required this.defender,
    required this.verdict}) : super(key: key);

  @override
  State<HackRecordWidget> createState() => _HackRecordWidgetState();
}


class _HackRecordWidgetState extends State<HackRecordWidget> {

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
          CustomPadding().get(0, Utils().getHeight(0.01, context), 0, Utils().getHeight(0.01, context), Text("Problem name : ${widget.problemName}")),
          CustomPadding().get(0, 0, 0, Utils().getHeight(0.005, context), Text("Hacker name : ${widget.hacker}")),
          CustomPadding().get(0, 0, 0, Utils().getHeight(0.005, context), Text("Defender name : ${widget.defender}")),
          Text("Verdict : ${widget.verdict}"),
        ],
      ),
    );
  }
}