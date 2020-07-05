import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtils {
  static changeStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: color,
/* set Status bar color in Android devices. */
            statusBarIconBrightness: Brightness.dark,
/* set Status bar icons color in Android devices.*/
            statusBarBrightness:
                Brightness.dark) /* set Status bar icon color in iOS. */
        );
  }
}
