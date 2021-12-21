import 'package:date_format/date_format.dart';

class User {
  late int userId;
  late String firstName;
  late String lastName;
  late String? address;
  late String? birthDate;
  late int? phoneNumber;
  late String login;
  late String pwd;
  late int profile;
  late dynamic rvListUrl;

  User.fromJson(Map<String, dynamic> json) {
    this.userId = json['user_id'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.address = json['address'];
    this.birthDate = json['birth_date'].toString(); // TODO: Change this line
    this.phoneNumber = json['phone_number'];
    this.login = json['login'];
    this.pwd = json['pwd'];
    this.profile = json['profile'];
    this.rvListUrl = json['rv_list_url'];
  }

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.address,
    this.birthDate,
    this.phoneNumber,
    required this.login,
    required this.pwd,
    required this.profile,
    this.rvListUrl,
  });
}
