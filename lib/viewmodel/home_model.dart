import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  int currentFragmentIndex = 0;

  switchFragment(index) {
    currentFragmentIndex = index;
    notifyListeners();
  }
}
