import 'package:covidhelper_mobile/view/widget/button_widget.dart';
import 'package:covidhelper_mobile/view/widget/textbutton_widget.dart';
import 'package:covidhelper_mobile/view/widget/textview_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<LoginModel>(builder: (context, loginModel, _) {
          return Form(
            key: loginModel.loginKey,
            child: ListView(
              children: [
                TitleWidget(
                  title: "Connexion",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                TextviewWidget(
                    controller: loginModel.loginController,
                    hintText: "Login",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    controller: loginModel.pwdController,
                    hintText: "Mot de passe",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                ButtonWidget(
                  btnAction: () {
                    if (loginModel.loginKey.currentState!.validate()) {
                      loginModel.login();
                    }
                    // Navigator.pushNamed(context, GeneratedRoutes.homeScreen);
                  },
                  btnText: "Connexion",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                TextButtonWidget(
                  btnAction: () {
                    Navigator.pushReplacementNamed(
                        context, GeneratedRoutes.signupScreen);
                  },
                  btnText: "Créer un compte",
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
