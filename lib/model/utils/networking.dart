import 'dart:convert';

import 'package:covidhelper_mobile/model/user.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:http/http.dart' as http;

class Networking {
  static final String baseUrl = "https://api-covidhelper-v1.herokuapp.com";
  static final String usersBaseUrl = "/users";
  static final String structuresBaseUrl = "/structures";
  static final String rvBaseUrl = "/rvs";

  static List<dynamic> rvList = [];
  static List<dynamic> structureList = [];

  // login
  static login(String email, String password) async {
    // User user;

    await http
        .post(
      Uri.parse(baseUrl + usersBaseUrl + "/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"login": email, "pwd": password}),
    )
        .then((value) {
      print("CURRENT USER : " + value.statusCode.toString());

      if (value.statusCode == 200) {
        LoginModel.user = User.fromJson(jsonDecode(value.body));
      } else {
        LoginModel.user = null;
      }
    }).onError((error, stackTrace) {
      print(stackTrace);
      LoginModel.user = null;
    });
  }

  static getUserRvs() async {
    print("RV URL = " + LoginModel.user!.rvListUrl);
    await http.get(
      Uri.parse(LoginModel.user!.rvListUrl),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      rvList = jsonDecode(response.body);
      print(rvList);
    });
  }

  static getStructures() async {
    print("Structure URL = " + baseUrl + structuresBaseUrl);
    await http.get(
      Uri.parse(baseUrl + structuresBaseUrl),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      structureList = jsonDecode(response.body);
      print(structureList);
    });
  }

  static addRv(date, object, userId, structId) async {
    print("Structure URL = " + baseUrl + structuresBaseUrl);
    await http.post(
      Uri.parse(baseUrl + rvBaseUrl),
      body: jsonEncode({
        "date_rv": date,
        "objet": object,
        "etat": -1,
        "users": {"user_id": userId},
        "structures": {"struct_id": structId}
      }),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      if (response.statusCode == 201) {
        print("Rv enregistré avec succès");
      } else {
        print("Erreur d'enregsitrement");
      }
    });
  }
}
