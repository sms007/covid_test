import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

double latitude;
double longitude;

class PlaceName {
  Future getPositionLatLong() async {
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // print(_position);

    List<Placemark> placeMark = await Geolocator()
        .placemarkFromCoordinates(_position.latitude, _position.longitude);
    Placemark place = placeMark[0];
    print(place.administrativeArea);
    print(place.locality);
    // print(place);
    latitude = _position.latitude;
    longitude = _position.longitude;

    return place.locality.toString();
    //return place;

//    String placeName =
//        getPlace(_position.latitude, _position.longitude).toString();
//    print(placeName);
  }

  Future getState() async {
//    Position _position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //print(_position);

    List<Placemark> placeMark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    Placemark place = placeMark[0];
    // print(place.administrativeArea);
    //print(place);
    return place.administrativeArea.toString();
    //return place;

//    String placeName =
//        getPlace(_position.latitude, _position.longitude).toString();
//    print(placeName);
  }

//  Future<dynamic> getPlace(double latitude, double longitude) async {
//    List<Placemark> placeMark =
//        await Geolocator().placemarkFromCoordinates(latitude, longitude);
//    Placemark place = placeMark[0];
//    print('called');
//    // print(place.locality);
//    return place.locality;
//  }

}
