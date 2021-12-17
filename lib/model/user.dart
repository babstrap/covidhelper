class User {
  late int userId;
  late String firstName;
  late String lastName;
  late String? address;
  late DateTime? birthDate;
  late int? phoneNumber;
  late String login;
  late String pwd;
  late int profile;
  late dynamic? rvListUrl;

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
