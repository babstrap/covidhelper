import 'package:covidhelper_mobile/model/user.dart';
import 'package:http/http.dart' as http;

class Networking {
  static final String baseUrl = "https://api-covidhelper-v1.herokuapp.com";

  // login
  static login(String email, String password) async {
    // User user;
    await http.post(
      Uri.parse("/users/login"),
      body: {"login": "ziza", "pwd": "zizo"},
    ).then((value) {
      print(value);
    }).onError((error, stackTrace) {
      print(stackTrace);
    });

    return null;
  }
}
