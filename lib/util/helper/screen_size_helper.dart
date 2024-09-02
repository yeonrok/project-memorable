import 'package:flutter/material.dart';

abstract class ScreenSizeHelper {
  static double getHeightByPercentOfScreen(
      double percent, BuildContext context) {
    return MediaQuery.of(context).size.height * percent / 100;
  }
}
