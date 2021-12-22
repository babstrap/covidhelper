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
      RvsFragment(),
      StructsFragment(),
      MapFragment(),
      //SettingsFragment(),
    ];

    return Consumer<HomeModel>(
      builder: (context, homeModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                ),
                SizedBox(width: 5),
                Text(
                  LoginModel.user!.firstName + " " + LoginModel.user!.lastName,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Colors.black),
            actions: [Icon(Icons.settings_rounded)],
          ),
          body: listFragment[homeModel.currentFragmentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: "RV",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_rounded),
                label: "Structure",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: "Carte",
              ),
            ],
            currentIndex: homeModel.currentFragmentIndex,
            onTap: (index) {
              homeModel.switchFragment(index);
            },
          ),
        );
      },
    );
  }
}
