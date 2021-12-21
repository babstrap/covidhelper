import 'package:covidhelper_mobile/model/utils/networking.dart';
import 'package:covidhelper_mobile/view/add_rv_screen.dart';
import 'package:covidhelper_mobile/view/struct_details_screen.dart';
import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:covidhelper_mobile/viewmodel/structure_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class StructureRowWidget extends StatelessWidget {
  int itemIndex;
  StructureRowWidget({Key? key, required this.itemIndex}) : super(key: key);

  // Call struct
  // Add RV

  showStructDetailScreen(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return StructDetailsScreen();
      },
    );
  }

  showAddRvScreen(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return AddRvScreen();
      },
    );
  }

  callStruct(phoneNumber) async {
    // Start calling
    await FlutterPhoneDirectCaller.callNumber(phoneNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    RvModel rvModel = Provider.of<RvModel>(context, listen: false);
    return Consumer<StructureModel>(builder: (context, structModel, _) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
              caption: 'Appel',
              color: Colors.green,
              icon: Icons.call_rounded,
              onTap: () {
                callStruct(Networking.structureList[itemIndex]['contact']);
              }),
          IconSlideAction(
              caption: 'RV',
              color: Colors.blue,
              icon: Icons.calendar_today_rounded,
              onTap: () {
                rvModel.selectStruct(itemIndex);
                showAddRvScreen(context);
              }),
        ],
        child: ListTile(
          title: Text(Networking.structureList[itemIndex]['nom']),
          subtitle: Text(Networking.structureList[itemIndex]['nbr_vaccin_dispo']
              .toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
          onTap: () {
            structModel.selectOneStruct(itemIndex);
            showStructDetailScreen(context);
          },
        ),
      );
    });
  }
}
