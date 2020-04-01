import 'package:flutter/material.dart';

class Counts extends StatelessWidget {
  final String type;
  final String count;
  final String delta;

  Counts({this.type, this.count, this.delta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '[+$delta]',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
