import 'package:covidhelper_mobile/model/rv.dart';
import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class RvModel extends ChangeNotifier {
  List<Rv> rvList = [];

  GlobalKey<FormState> rvKey = GlobalKey<FormState>();
  List<String> objectList = ["Test", "Vaccin"];

  int? structSelected;
  String objectSelected = "Test";
  DateTime? dateSelected;

  getUserRvs() async {
    await Networking.getUserRvs();
    //notifyListeners();
  }

  selectStruct(structId) {
    this.structSelected = structId;
    print("Struct selected " + structSelected.toString());
  }

  selectObjet(objectId) {
    this.objectSelected = objectId;
    print("Rv selected " + objectSelected.toString());
    notifyListeners();
  }

  selectDate(date) {
    this.dateSelected = date;
    print("Date selected " + dateSelected.toString());
    notifyListeners();
  }

  addRv() {
    print("User " + LoginModel.user!.userId.toString());
    print("Structure " + this.structSelected.toString());
    print("Objet " + this.objectSelected);
    print("Date " + dateSelected.toString());
    int objectValue =
        (objectSelected.toLowerCase() == "Test".toLowerCase()) ? 1 : 0;
    print("Objet value " + objectValue.toString());
    String dateValue = formatDate(dateSelected!, [yyyy, "-", mm, "-", dd]);
    print("Date " + dateValue);

    Networking.addRv(
        dateValue, objectValue, LoginModel.user!.userId, structSelected);
  }
}
