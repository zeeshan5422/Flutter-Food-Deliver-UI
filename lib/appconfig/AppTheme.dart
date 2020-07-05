import 'package:flutter/material.dart';
import 'package:flutterdelivery/appconfig/app_constants.dart';

class AppTheme {
  static MaterialColor _selectedColor = Colors.green;

  static ThemeData current() {
    return ThemeData(
      primarySwatch: _selectedColor,
      primaryColor: _selectedColor[500],
      fontFamily: "Roboto",
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(default_padding*2),
          ),
        ),
      ),
    );
  }

  static TextStyle titleText(BuildContext context) {
    return titleTextSimple(context)
        .copyWith(color: Theme.of(context).primaryColor);
  }

  static TextStyle titleTextSimple(BuildContext context) {
    return Theme.of(context).textTheme.title;
  }

  static TextStyle subTitleText(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle
        .copyWith(color: Theme.of(context).primaryColor);
  }

  static TextStyle tinyText(BuildContext context) {
    return Theme.of(context).textTheme.body2.copyWith(fontSize: 10);
  }
}
