import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/db/db.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/location_util.dart';

class GreatPlaces with ChangeNotifier {
  List<PlaceModel> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await Db.getData('places');
    _items = dataList
        .map(
          (item) => PlaceModel(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['lat'],
              longitude: item['lng'],
              adderess: item['address']
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<PlaceModel> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  PlaceModel getItem(int index) {
    return _items[index];
  }

  Future<void> addPlaces(String title, File image, LatLng position) async {
    String address = await LocationUtil.getAddressFrom(position);
    final newPlace = PlaceModel(
      id: Random().nextDouble().toString(),
      title: title,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        adderess: address,
      ),
      image: image,
    );

    _items.add(newPlace);
    Db.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': position.latitude,
      'lng': position.longitude,
      'address': address
    });
    notifyListeners();
  }
}
