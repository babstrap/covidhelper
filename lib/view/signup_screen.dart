import 'package:covidhelper_mobile/generated_route.dart';
import 'package:covidhelper_mobile/view/widget/button_widget.dart';
import 'package:covidhelper_mobile/view/widget/textbutton_widget.dart';
import 'package:covidhelper_mobile/view/widget/textview_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:flutter/material.dart';

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
        child: Form(
          child: ListView(
            children: [
              TitleWidget(
                title: "Inscription",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              TextviewWidget(hintText: "Prénom"),
              TextviewWidget(hintText: "Nom"),
              TextviewWidget(hintText: "Login"),
              TextviewWidget(hintText: "Mot de passe"),
              ButtonWidget(
                btnAction: () {},
                btnText: "Inscription",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              TextButtonWidget(
                btnAction: () {
                  Navigator.pushNamed(context, GeneratedRoutes.loginScreen);
                },
                btnText: "J'ai déjà un compte",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
