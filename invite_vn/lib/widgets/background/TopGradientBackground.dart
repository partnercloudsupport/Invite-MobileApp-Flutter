import 'package:flutter/material.dart';

class TopGradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF0D9090), Color(0xFF3AD9A9)],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: Color(0xFFF9F9F9),
          ),
        )
      ],
    );
  }
}
