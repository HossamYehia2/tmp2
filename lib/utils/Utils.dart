import 'package:flutter/cupertino.dart';

import '../Utils/CustomPadding.dart';
import '../Utils/SizeUtils.dart';

class Utils {
  Widget concatenate(firstString, secondString, textColor, icon, context, {double? textSize = 14.0}) {
    return CustomPadding().get(
      getWidth(0.01, context),
      getHeight(0.01, context),
      0,
      0,
      Row(
        children: [
          icon,
          CustomPadding().get(getWidth(0.01, context), 0, 0, 0, Text("$firstString", style: TextStyle(fontSize: textSize),)),
          Text(" $secondString", style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: textSize)),
        ],
      ),
    );
  }

  double getHeight(ratio, context) {
    return SizeUtils().getHeightRatio(context, ratio);
  }

  double getWidth(ratio, context) {
    return SizeUtils().getWidthRatio(context, ratio);
  }
}