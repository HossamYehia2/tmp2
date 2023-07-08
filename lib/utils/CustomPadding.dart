import 'package:flutter/material.dart';

class CustomPadding {
  Widget get(L, T, R, B, obj) {
    return Padding(
      padding: EdgeInsets.fromLTRB(L.toDouble(), T.toDouble(), R.toDouble(), B.toDouble()),
      child: obj,
    );
  }
}