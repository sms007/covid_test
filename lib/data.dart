import 'dart:convert';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;

class KeyData {
  Future<dynamic> getData() async {
    var response = await http.get(keyDataURL);
    //headers: {"Accept": "application/json"});

    var data = jsonDecode(response.body);

    //print('this is ${data.length}');

    return data;
  }
}

class DistrictData {
  Future<dynamic> getStateData() async {
    var stateResponse = await http.get(stateDataURL);
    var stateData = jsonDecode(stateResponse.body);
    //print('this is state data: $stateData');
    return stateData;
  }
}
