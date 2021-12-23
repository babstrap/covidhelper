import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:covidhelper_mobile/model/user.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Networking {
  static final String baseUrl = "https://api-covidhelper-v1.herokuapp.com";
  static final String usersBaseUrl = "/users";
  static final String structuresBaseUrl = "/structures";
  static final String rvBaseUrl = "/rvs";

  static List<dynamic> rvList = [];
  static List<dynamic> structureList = [];

  static int response = -1;

  // Response indicator
  static indicatorMsg(
      BuildContext context, String title, String msg, Color color) {
    return Flushbar(
      title: title,
      message: msg,
      backgroundColor: color,
      duration: Duration(seconds: 3),
    ).show(context);
  }

  // Signup signup
  static signup(String firstName, String lastName, String phoneNumber,
      String login, String password) async {
    // User user;
    response = -1;

    await http
        .post(
      Uri.parse(baseUrl + usersBaseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "first_name": firstName,
        "last_name": lastName,
        "address": "",
        "birth_date": "",
        "phone_number": int.parse(phoneNumber),
        "login": login,
        "pwd": password,
        "profile": 0
      }),
    )
        .then((value) {
      print("CURRENT USER : " + value.statusCode.toString());

      if (value.statusCode == 201) {
        LoginModel.user = User.fromJson(jsonDecode(value.body));
        print("Votre compte est ouvert avce succès");
      } else {
        LoginModel.user = null;
        print("Erreur d'ouverture du compte");
      }
      response = value.statusCode;
    }).onError((error, stackTrace) {
      print(stackTrace);
      LoginModel.user = null;
    }).timeout(Duration(seconds: 15), onTimeout: () {
      print("===> Time out");
      response = -1;
    });
  }

  // login
  static login(String login, String password) async {
    // User user;
    response = -1;

    await http
        .post(
      Uri.parse(baseUrl + usersBaseUrl + "/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"login": login, "pwd": password}),
    )
        .then((value) {
      print("CURRENT USER : " + value.statusCode.toString());

      if (value.statusCode == 200) {
        print("Login OK");
        LoginModel.user = User.fromJson(jsonDecode(value.body));
      } else {
        print("Login KO");
        LoginModel.user = null;
      }
      response = value.statusCode;
    }).onError((error, stackTrace) {
      print(stackTrace);
      LoginModel.user = null;
    }).timeout(Duration(seconds: 15), onTimeout: () {
      print("===> Time out");
      response = -1;
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
