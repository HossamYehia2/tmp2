import 'package:flutter/cupertino.dart';

import '../Utils/CustomPadding.dart';
import '../Utils/SizeUtils.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void openLink(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
    }
  }
}