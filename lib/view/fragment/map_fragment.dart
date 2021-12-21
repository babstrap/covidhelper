import 'package:covidhelper_mobile/viewmodel/map_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({Key? key}) : super(key: key);

  @override
  State<MapFragment> createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  @override
  Widget build(BuildContext context) {
    MapModel mapModel = Provider.of(context, listen: false);
    return FutureBuilder(
      future: mapModel.addStructureMarker(),
      builder: (context, snapshot) {
        return Center(
          child: GoogleMap(
            mapType: MapType.satellite,
            initialCameraPosition: mapModel.kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              mapModel.controller.complete(controller);
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: mapModel.listPositions!,
            onTap: (position) {
              print("Latitude : " + position.latitude.toString());
              print("Longitude : " + position.longitude.toString());
            },
          ),
        );
      },
    );
  }
}
