import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetLocation {
  Future<dynamic> getLocation() async {
    var _locationData = await Location().getLocation();
    print(_locationData);
    return _locationData;
  }
}
