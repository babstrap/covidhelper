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
    var structure = Networking.structureList[itemIndex];
    return Consumer<StructureModel>(builder: (context, structModel, _) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
                closeOnTap: true,
                caption: 'Appel',
                color: Colors.green,
                icon: Icons.call_rounded,
                onTap: () {
                  callStruct(structure['contact']);
                }),
            IconSlideAction(
                closeOnTap: true,
                caption: 'RV',
                color: Colors.blue,
                icon: Icons.calendar_today_rounded,
                onTap: () {
                  rvModel.selectStruct(itemIndex);
                  showAddRvScreen(context);
                }),
          ],
          child: ListTile(
            dense: true,
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vaccin",
                  style: TextStyle(
                      color: (structure['nbr_vaccin_dispo'] > 0)
                          ? Colors.green
                          : Colors.red),
                ),
                Text(
                  "Test",
                  style: TextStyle(
                      color: (structure['nbr_test_dispo'] > 0)
                          ? Colors.green
                          : Colors.red),
                )
              ],
            ),
            title: Text(
              structure['nom'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              structure['adresse'].toString(),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
            onTap: () {
              structModel.selectOneStruct(itemIndex);
              showStructDetailScreen(context);
            },
          ),
        ),
      );
    });
  }
}
