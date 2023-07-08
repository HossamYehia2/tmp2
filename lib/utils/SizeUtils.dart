import 'package:flutter/material.dart';

class SizeUtils {
  getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  getHeightRatio(context, ratio) {
    return getHeight(context) * ratio;
  }

  getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  getWidthRatio(context, ratio) {
    return getWidth(context) * ratio;
  }
}