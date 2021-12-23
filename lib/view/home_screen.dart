import 'package:covidhelper_mobile/view/fragment/home_fragment.dart';
import 'package:covidhelper_mobile/view/fragment/map_fragment.dart';
import 'package:covidhelper_mobile/view/fragment/rvs_fragment.dart';
import 'package:covidhelper_mobile/view/fragment/structs_fragment.dart';
import 'package:covidhelper_mobile/viewmodel/home_model.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var listFragment = [
      HomeFragment(),
      RvsFragment(),
      StructsFragment(),
      MapFragment(),
      //SettingsFragment(),
    ];

    return Consumer<HomeModel>(
      builder: (context, homeModel, child) {
        return Scaffold(
          body: listFragment[homeModel.currentFragmentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Accueil",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: "RV",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_rounded),
                label: "Struct",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: "Carte",
              ),
            ],
            currentIndex: homeModel.currentFragmentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              homeModel.switchFragment(index);
            },
          ),
        );
      },
    );
  }
}
