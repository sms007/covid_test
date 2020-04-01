import 'package:covidtest/constants.dart';
import 'package:covidtest/place.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'dist_info_card.dart';
import 'general_info_card.dart';
import 'place.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // India variables
  String confirmed = '';
  String active = '';
  String deceased = '';
  String recovered = '';

  int confirmedDelta = 0;
  int activeDelta = 0;
  int deceasedDelta = 0;
  int recoveredDelta = 0;

  // location variables
  var currentLocation;
  String currentPlace = '';
  String distConfirmed = '';
  String distDelta = '';
  String state = '';

  //state counts variables
  String stateConfirmed = '';
  String stateActive = '';
  String stateRecovered = '';
  String stateDeceased = '';

  int stateConfirmedDelta = 0;
  int stateActiveDelta = 0;
  int stateRecoveredDelta = 0;
  int stateDeceasedDelta = 0;

  void positionData() async {
    PlaceName placeName = PlaceName();
    String _placeName = await placeName.getPositionLatLong();
    String _state = await placeName.getState();
    setState(() {
      currentPlace = _placeName;
      state = _state;
    });

    getDistData(currentPlace, state);
    getKeyData(state);
    print('place name: $currentPlace');
  }

  void getKeyData(String _state) async {
    KeyData keyData = KeyData();
    var _keyData = await keyData.getData();
    int index = 0;
    print('total count: ${_keyData['statewise'][0]['confirmed']}');
    setState(() {
      confirmed = _keyData['statewise'][0]['confirmed'];
      confirmedDelta = _keyData['statewise'][0]['delta']['confirmed'];
      active = _keyData['statewise'][0]['active'];
      activeDelta = _keyData['statewise'][0]['delta']['active'];
      recovered = _keyData['statewise'][0]['recovered'];
      recoveredDelta = _keyData['statewise'][0]['delta']['recovered'];
      deceased = _keyData['statewise'][0]['deaths'];
      deceasedDelta = _keyData['statewise'][0]['delta']['deaths'];
    });

    for (int i = 0; _keyData['statewise'][i]['state'] != _state; i++) {
      print(i);
      index = i + 1;
    }
    print(_keyData['statewise'][index]['active']);
    setState(() {
      stateConfirmed = _keyData['statewise'][index]['confirmed'];
      stateConfirmedDelta = _keyData['statewise'][index]['delta']['confirmed'];
      stateActive = _keyData['statewise'][index]['active'];
      stateActiveDelta = _keyData['statewise'][index]['delta']['active'];
      stateRecovered = _keyData['statewise'][index]['recovered'];
      stateRecoveredDelta = _keyData['statewise'][index]['delta']['recovered'];
      stateDeceased = _keyData['statewise'][index]['deaths'];
      stateDeceasedDelta = _keyData['statewise'][index]['delta']['deaths'];
    });

    //statewise[1].active
    //statewise[1].delta.confirmed
    //statewise[0].confirmed
  }
  // statewise[2].state
  //statewise[2].active

  void getDistData(String district, String state) async {
    DistrictData districtData = DistrictData();
    var _distData = await districtData.getStateData();
    //print('called dist');
    // print('this is disctrict: $district');
    // print('this is disctrict: $state');
    //print(_distData['Karnataka']['districtData'][district]['confirmed']);
    setState(() {
      distConfirmed =
          _distData[state]['districtData'][district]['confirmed'].toString();
      distDelta = _distData[state]['districtData'][district]['delta']
              ['confirmed']
          .toString();
    });
    //print(distConfirmed);
    //Karnataka.districtData.Bengaluru.delta.confirmed
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    positionData();
    // getKeyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          positionData();
        },
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        children: <Widget>[
          //District card
          DistInfoCard(
              districtName: currentPlace,
              confirmedCount: distConfirmed,
              deltaCount: distDelta),

          GeneralInfoCard(
              color: kBlue,
              state: state,
              stateConfirmed: stateConfirmed,
              stateConfirmedDelta: stateConfirmedDelta,
              stateActive: stateActive,
              stateActiveDelta: stateActiveDelta,
              stateRecovered: stateRecovered,
              stateRecoveredDelta: stateRecoveredDelta,
              stateDeceased: stateDeceased,
              stateDeceasedDelta: stateDeceasedDelta),
          GeneralInfoCard(
              color: kGreen,
              state: 'India',
              stateConfirmed: confirmed,
              stateConfirmedDelta: confirmedDelta,
              stateActive: active,
              stateActiveDelta: activeDelta,
              stateRecovered: recovered,
              stateRecoveredDelta: recoveredDelta,
              stateDeceased: deceased,
              stateDeceasedDelta: deceasedDelta),
        ],
      )),
    );
  }
}
