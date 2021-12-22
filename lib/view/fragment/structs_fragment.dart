import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/widget/rv_row_widget.dart';
import 'package:covidhelper_mobile/view/widget/structure_row_widget.dart';
import 'package:covidhelper_mobile/view/widget/title_widget.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:covidhelper_mobile/viewmodel/structure_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StructsFragment extends StatelessWidget {
  const StructsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StructureModel structureModel =
        Provider.of<StructureModel>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20, left: 10),
              child: TitleWidget(title: "Structures de santé")),
          FutureBuilder(
            future: structureModel.getStructures(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text("Verifier votre connexion à internet"));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Consumer<RvModel>(
                builder: (context, rvModel, _) {
                  print("===>>> " + Networking.structureList.toString());
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StructureRowWidget(itemIndex: index);
                    },
                    // separatorBuilder: (context, index) => Divider(),
                    itemCount: Networking.structureList.length,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
