import 'package:covidhelper_mobile/view/widget/rv_row_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RvsFragment extends StatelessWidget {
  const RvsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: [Icon(Icons.add_circle_rounded)],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TitleWidget(title: "Rendez-vous"),
          ),
          Consumer<RvModel>(
            builder: (context, rvModel, _) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RvRowWidget(itemIndex: index);
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: rvModel.rvList.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
