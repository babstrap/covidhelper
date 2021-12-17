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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TitleWidget(title: "Structures de santé"),
        ),
        Consumer<StructureModel>(
          builder: (context, structModel, _) {
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return StructureRowWidget(itemIndex: index);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: structModel.structList.length,
            );
          },
        ),
      ],
    );
  }
}
