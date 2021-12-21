import 'package:covidhelper_mobile/model/user.dart';
import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController loginController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  static User? user;

  signup() async {
    await Networking.signup(firstNameController.text, lastNameController.text,
        phoneNumberController.text, loginController.text, pwdController.text);
  }
}
