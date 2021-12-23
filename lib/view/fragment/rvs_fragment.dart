import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/widget/rv_row_widget.dart';
import 'package:covidhelper_mobile/view/widget/statistics_box_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget_2.dart';
import 'package:covidhelper_mobile/viewmodel/login_model.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RvsFragment extends StatelessWidget {
  const RvsFragment({Key? key}) : super(key: key);

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
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LoginModel.user!.firstName,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    LoginModel.user!.lastName,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
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
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget2(
              title: "Vos statistiques",
              subTitle: Container(),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Row(
                  children: [
                    StatisticsBoxWidget(
                      boxColor: Colors.red,
                      boxIcon: Icons.calculate,
                      value: Networking.rvList.length,
                      title: 'Total RV',
                    ),
                    SizedBox(width: 15),
                    StatisticsBoxWidget(
                      boxColor: Colors.blue,
                      boxIcon: Icons.calculate,
                      value: Networking.rvList.length,
                      title: 'À venir',
                    ),
                  ],
                ),
              ),
            ),
            TitleWidget2(
              title: "Rendez-vous",
              subTitle: Text("2 à venir"),
            ),
            FutureBuilder(
              future: rvModel.getUserRvs(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Verifier votre connexion à internet"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Consumer<RvModel>(
                  builder: (context, rvModel, _) {
                    print("===>>> " + Networking.rvList.toString());
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RvRowWidget(itemIndex: index);
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: Networking.rvList.length,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
