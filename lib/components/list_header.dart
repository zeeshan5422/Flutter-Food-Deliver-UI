import 'package:flutter/material.dart';
import 'package:flutterdelivery/appconfig/AppTheme.dart';

class ListHeader extends StatelessWidget {
  final String heading;
  final String moreOptions;
  final double topPadding;

  ListHeader({this.heading, this.moreOptions, this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
            top: topPadding, left: 16.0, bottom: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(heading, style: AppTheme.titleTextSimple(context)),
            Text(
              moreOptions,
              style: AppTheme.tinyText(context).copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
