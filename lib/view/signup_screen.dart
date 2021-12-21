import 'package:covidhelper_mobile/generated_route.dart';
import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/widget/button_widget.dart';
import 'package:covidhelper_mobile/view/widget/textbutton_widget.dart';
import 'package:covidhelper_mobile/view/widget/textview_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:covidhelper_mobile/viewmodel/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SignupModel>(builder: (context, signupModel, _) {
          return Form(
            key: signupModel.loginKey,
            child: ListView(
              children: [
                TitleWidget(
                  title: "Incription",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                TextviewWidget(
                    controller: signupModel.firstNameController,
                    hintText: "Prénom",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    controller: signupModel.lastNameController,
                    hintText: "Nom",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    controller: signupModel.phoneNumberController,
                    hintText: "Téléphone",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    controller: signupModel.loginController,
                    hintText: "Login",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                TextviewWidget(
                    controller: signupModel.pwdController,
                    hintText: "Mot de passe",
                    validator: (String? value) {
                      if (value!.trim().isNotEmpty)
                        return null;
                      else
                        return "Ce champs est obligatoire !";
                    }),
                ButtonWidget(
                  btnAction: () async {
                    if (signupModel.loginKey.currentState!.validate()) {
                      await signupModel.signup();
                      if (Networking.response == 201)
                        Navigator.pushReplacementNamed(
                            context, GeneratedRoutes.loginScreen);
                      else // Message d'erreur
                        print("Erreur de connexion");
                    }
                    // Navigator.pushNamed(context, GeneratedRoutes.homeScreen);
                  },
                  btnText: "Inscription",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                TextButtonWidget(
                  btnAction: () {
                    Navigator.pushReplacementNamed(
                        context, GeneratedRoutes.loginScreen);
                  },
                  btnText: "J'ai déjà un compte",
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
