import 'package:another_flushbar/flushbar.dart';
import 'package:covidhelper_mobile/model/utils/networking.dart';
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

  showProgressIndicator(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Connexion en cours..."),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(),
              Text("Veuillez patienter"),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Consumer<LoginModel>(builder: (context, loginModel, _) {
          return Form(
            key: loginModel.loginKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: TitleWidget(
                    title: "Connexion",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                TextviewWidget(
                    prefixIcon: Icon(Icons.person_rounded),
                    controller: loginModel.loginController,
                    hintText: "Login",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    prefixIcon: Icon(Icons.lock_rounded),
                    controller: loginModel.pwdController,
                    hintText: "Mot de passe",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: ButtonWidget(
                    btnAction: () async {
                      if (loginModel.loginKey.currentState!.validate()) {
                        showProgressIndicator(context);
                        await loginModel.login();
                        if (Networking.response == 200) {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, GeneratedRoutes.homeScreen);
                        } else if (Networking.response == 500) {
                          // Message d'erreur
                          print("Erreur de connexion");
                          Navigator.pop(context);
                          Networking.indicatorMsg(
                            context,
                            "Erreur: Identifiants incorrects",
                            "Ce compte n'existe pas. ",
                            Colors.red,
                          );
                        } else {
                          Navigator.pop(context);
                          Networking.indicatorMsg(
                            context,
                            "Erreur: Connexion instable",
                            "Veuillez vérifier votre connexion à internet.",
                            Colors.red,
                          );
                        }
                      }
                    },
                    btnText: "Connexion",
                  ),
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
