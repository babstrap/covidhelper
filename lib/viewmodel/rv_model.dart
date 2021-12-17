import 'package:covidhelper_mobile/model/rv.dart';
import 'package:covidhelper_mobile/model/structure.dart';
import 'package:covidhelper_mobile/model/user.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class RvModel extends ChangeNotifier {
  List<Rv> rvList = [
    Rv(
      rvId: 1,
      dateRv: formatDate(DateTime.now(), [dd, ' ', M, ' ', yyyy]),
      objet: "Test",
      etat: 1,
      users: User(
        userId: 1,
        firstName: "Aziz",
        lastName: "Seye",
        login: "OK",
        pwd: "OK",
        profile: 1,
      ),
      structures: Structure(
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
      ),
    ),
    Rv(
      rvId: 1,
      dateRv: formatDate(DateTime.now(), [dd, ' ', M, ' ', yyyy]),
      objet: "Vaccin",
      etat: 1,
      users: User(
        userId: 1,
        firstName: "Aziz",
        lastName: "Seye",
        login: "OK",
        pwd: "OK",
        profile: 1,
      ),
      structures: Structure(
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
      ),
    )
  ];
}
