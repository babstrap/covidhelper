import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController loginController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  login() async {
    await Networking.login(loginController.text, pwdController.text);
  }
}
