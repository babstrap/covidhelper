import 'package:covidhelper_mobile/generated_route.dart';
import 'package:covidhelper_mobile/model/structure.dart';
import 'package:covidhelper_mobile/viewmodel/home_model.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:covidhelper_mobile/viewmodel/map_model.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:covidhelper_mobile/viewmodel/signup_model.dart';
import 'package:covidhelper_mobile/viewmodel/structure_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginModel()),
        ChangeNotifierProvider(create: (context) => SignupModel()),
        ChangeNotifierProvider(create: (context) => HomeModel()),
        ChangeNotifierProvider(create: (context) => RvModel()),
        ChangeNotifierProvider(create: (context) => StructureModel()),
        ChangeNotifierProvider(create: (context) => MapModel()),
      ],
      child: MaterialApp(
        initialRoute: GeneratedRoutes.loginScreen,
        onGenerateRoute: GeneratedRoutes.onGeneratedRoute,
      ),
    );
  }
}
