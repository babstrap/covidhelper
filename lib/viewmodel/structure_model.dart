import 'package:covidhelper_mobile/model/structure.dart';
import 'package:flutter/material.dart';

class StructureModel extends ChangeNotifier {
  List<Structure> structList = [
    Structure(
      structId: 1,
      nom: "Fann",
      adresse: "Av. UCAD",
      contact: 336787878,
      latitude: -14.1245,
      longitude: 16.14567,
      nbreTest: 12,
      nbreVac: 23,
      nbrTestDispo: 12,
      nbrVaccinDispo: 12,
    )
  ];

  late int selectedStructIdex = 0;
  selectOneStruct(index) {
    selectedStructIdex = index;
  }
}
