import 'package:flutter/material.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:great_places/view/screens/map_screen.dart';
import 'package:great_places/view/screens/place_detail_screen.dart';
import 'package:great_places/view/screens/place_form_screen.dart';
import 'package:great_places/view/screens/places_list_screen.dart';
import 'package:great_places/view_model/great_places.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            secondary: Colors.amber,
          ),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.home: (ctx) => const PlacesListScreen(),
          AppRoutes.placeForm: (ctx) => const PlaceFormScreen(),
          AppRoutes.mapScreen: (ctx) => const MapScreen(),
          AppRoutes.placeDetail: (ctx) => const PlaceDetailScreen()
        },
      ),
    );
  }
}
