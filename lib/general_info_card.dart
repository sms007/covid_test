import 'package:flutter/material.dart';

import 'constants.dart';
import 'counts.dart';

class GeneralInfoCard extends StatelessWidget {
  const GeneralInfoCard({
    Key key,
    @required this.state,
    @required this.stateConfirmed,
    @required this.stateConfirmedDelta,
    @required this.stateActive,
    @required this.stateActiveDelta,
    @required this.stateRecovered,
    @required this.stateRecoveredDelta,
    @required this.stateDeceased,
    @required this.stateDeceasedDelta,
    @required this.color,
  }) : super(key: key);

  final String state;
  final String stateConfirmed;
  final int stateConfirmedDelta;
  final String stateActive;
  final int stateActiveDelta;
  final String stateRecovered;
  final int stateRecoveredDelta;
  final String stateDeceased;
  final int stateDeceasedDelta;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(20.0),
      // height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)]),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                state,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Counts(
                type: 'Confirmed',
                count: stateConfirmed,
                delta: stateConfirmedDelta.toString(),
              ),
              Counts(
                type: 'Active',
                count: stateActive,
                delta: stateActiveDelta.toString(),
              ),
              Counts(
                type: 'Recovered',
                count: stateRecovered,
                delta: stateRecoveredDelta.toString(),
              ),
              Counts(
                type: 'Deceased',
                count: stateDeceased,
                delta: stateDeceasedDelta.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
