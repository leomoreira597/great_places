import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  PlaceModel getItem(int index) {
    return _items[index];
  }

  void addPlaces(String title, File image) {
    final newPlace = PlaceModel(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );
    
    _items.add(newPlace);
    notifyListeners();
  }
}
