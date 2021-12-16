import 'package:covidhelper_mobile/view/home_screen.dart';
import 'package:covidhelper_mobile/view/login_screen.dart';
import 'package:covidhelper_mobile/view/signup_screen.dart';
import 'package:flutter/material.dart';

class GeneratedRoutes {
  static const String loginScreen = 'loginScreen';
  static const String signupScreen = 'signupScreen';
  static const String homeScreen = 'homeScreen';

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Container(child: Center(child: Text('404'))));
    }
  }
}
