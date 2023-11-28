import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? adderess;

  PlaceLocation(
      {required this.latitude, required this.longitude, this.adderess});
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
