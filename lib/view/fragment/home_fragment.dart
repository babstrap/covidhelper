import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/widget/statistics_box_widget.dart';
import 'package:covidhelper_mobile/view/widget/statistics_mini_box_widget.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RvModel rvModel = Provider.of<RvModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue,",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    LoginModel.user!.firstName +
                        " " +
                        LoginModel.user!.lastName,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
          actions: [Icon(Icons.settings_rounded)],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(child: Text("Sénégal")),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintText: "Pays",
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Dernière mise à jour",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("2021-12-22"),
                      trailing: TextButton(
                          onPressed: () {}, child: Text("Voir plus")),
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          StatisticsMiniBoxWidget(
                            boxColor: Colors.orange,
                            boxIcon: Icons.calculate,
                            value: 74256,
                            title: 'Infectés',
                          ),
                          SizedBox(width: 15),
                          StatisticsMiniBoxWidget(
                            boxColor: Colors.red,
                            boxIcon: Icons.calculate,
                            value: 1890,
                            title: 'Décédés',
                          ),
                          SizedBox(width: 15),
                          StatisticsMiniBoxWidget(
                            boxColor: Colors.green,
                            boxIcon: Icons.calculate,
                            value: 72366,
                            title: 'Guéris',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Propagation du virus",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: TextButton(
                          onPressed: () {}, child: Text("Voir plus")),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5.0)
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              image: AssetImage("assets/covidmaps.jpeg"))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
