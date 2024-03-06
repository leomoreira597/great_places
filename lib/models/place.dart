import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? adderess;

  const PlaceLocation(
      {required this.latitude, required this.longitude, this.adderess});

  LatLng toLatLng(){
    return LatLng(latitude, longitude);
  }
}

class PlaceModel {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  PlaceModel(
      {required this.id,
      required this.title,
      this.location,
      required this.image});
}
