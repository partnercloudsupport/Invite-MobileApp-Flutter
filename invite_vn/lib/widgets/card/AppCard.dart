import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const AppCard({
    Key key,
    this.child,
    this.width = double.maxFinite,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
