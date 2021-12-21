import 'package:covidhelper_mobile/model/structure.dart';
import 'package:covidhelper_mobile/model/user.dart';

class Rv {
  late int rvId;
  late String dateRv;
  late int? resultat;
  late String objet;
  late int etat;
  late User users;
  late Structure structures;
  late String? nextRv;

  Rv.fromJson(Map<String, dynamic> json) {
    this.rvId = json[''];
    this.dateRv = json[''];
    this.resultat = json[''];
    this.objet = json[''];
    this.etat = json[''];
    this.users = json[''];
    this.structures = json[''];
    this.nextRv = "";
  }

  Rv({
    required this.rvId,
    required this.dateRv,
    this.resultat,
    required this.objet,
    required this.etat,
    required this.users,
    required this.structures,
    this.nextRv,
  });
}
