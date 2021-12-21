import 'package:covidhelper_mobile/model/structure.dart';
import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/add_rv_screen.dart';
import 'package:covidhelper_mobile/view/widget/button_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/viewmodel/map_model.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:covidhelper_mobile/viewmodel/structure_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class StructDetailsScreen extends StatelessWidget {
  const StructDetailsScreen({Key? key}) : super(key: key);

  showAddRvScreen(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return AddRvScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MapModel mapModel = Provider.of<MapModel>(context, listen: false);
    StructureModel structureModel =
        Provider.of<StructureModel>(context, listen: false);
    RvModel rvModel = Provider.of<RvModel>(context, listen: false);

    var structure = Networking.structureList[structureModel.selectedStructIdex];

    CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(structure['latitude'], structure['longitude']),
      zoom: 10,
    );

    Marker _structMarker = Marker(
      markerId: MarkerId(structure['nom']),
      position: LatLng(structure['latitude'], structure['longitude']),
      infoWindow: InfoWindow(
        title: structure['nom'],
        snippet: structure['nbr_test_dispo'].toString(),
        onTap: () {
          // TODO: Implement this
        },
      ),
    );

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      // shrinkWrap: true,
      children: [
        Expanded(
          flex: 1,
          child: GoogleMap(
            mapType: MapType.satellite,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              mapModel.controller.complete(controller);
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: {_structMarker},
            onTap: (position) {
              print("Latitude : " + position.latitude.toString());
              print("Longitude : " + position.longitude.toString());
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleWidget(title: structure['nom']),
                ListTile(
                    leading: Icon(Icons.location_on_rounded),
                    title: Text(structure['adresse']),
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 1,
                    visualDensity: VisualDensity.compact),
                ListTile(
                    leading: Icon(Icons.phone_rounded),
                    title: Text(structure['contact'].toString()),
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 1,
                    visualDensity: VisualDensity.compact),
                ListTile(
                    leading: Icon(Icons.text_snippet),
                    title: Text(structure['nbr_test_dispo'].toString() +
                        " test disponibles"),
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 1,
                    visualDensity: VisualDensity.compact),
                ListTile(
                    leading: Icon(Icons.health_and_safety_rounded),
                    title: Text(structure['nbr_vaccin_dispo'].toString() +
                        " vaccins disponibles"),
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 1,
                    visualDensity: VisualDensity.compact),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                ButtonWidget(
                    btnAction: () {
                      rvModel.selectStruct(structure['struct_id']);
                      showAddRvScreen(context);
                    },
                    btnText: "Prendre rendez-vous"),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
