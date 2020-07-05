import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final Widget child;

  GenericCard({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 5),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
