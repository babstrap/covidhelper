import 'dart:async';

import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/struct_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MapModel extends ChangeNotifier {
  Completer<GoogleMapController> controller = Completer();

  Set<Marker>? listPositions = {};

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(14.769242170201661, -14.973790906369688),
    zoom: 6.5,
  );

  addStructureMarker() async {
    await Networking.getStructures();
    for (var oneStruct in Networking.structureList) {
      listPositions!.add(
        Marker(
          markerId: MarkerId(oneStruct['nom']),
          position: LatLng(oneStruct['latitude'], oneStruct['longitude']),
          infoWindow: InfoWindow(
            title: oneStruct['nom'],
            snippet: oneStruct['nbr_test_dispo'].toString(),
            onTap: () {
              print("Hello world !");
            },
          ),
        ),
      );
    }
    print("LENGHT " + listPositions!.length.toString());
    notifyListeners();
  }
}
