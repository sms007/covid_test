import 'package:flutter/material.dart';

class DistrictCounts extends StatelessWidget {
  const DistrictCounts({
    Key key,
    @required this.distConfirmed,
    @required this.distDelta,
  }) : super(key: key);

  final String distConfirmed;
  final String distDelta;

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmed',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              distConfirmed,
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 14.0,
                ),
                Text(
                  '+$distDelta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
