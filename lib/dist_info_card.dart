import 'package:flutter/material.dart';

import 'constants.dart';
import 'district_counts.dart';

class DistInfoCard extends StatelessWidget {
  DistInfoCard({
    Key key,
    @required this.confirmedCount,
    @required this.deltaCount,
    @required this.districtName,
  }) : super(key: key);

  final String confirmedCount;
  final String deltaCount;
  final String districtName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(20.0),
      // height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPurple,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)]),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                districtName,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 16.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          DistrictCounts(distConfirmed: confirmedCount, distDelta: deltaCount),
        ],
      ),
    );
  }
}
