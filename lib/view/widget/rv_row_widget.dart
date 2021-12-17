import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class RvRowWidget extends StatelessWidget {
  int itemIndex;
  RvRowWidget({Key? key, required this.itemIndex}) : super(key: key);

  // Edit RV
  // Cancel RV

  @override
  Widget build(BuildContext context) {
    return Consumer<RvModel>(builder: (context, rvModel, _) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
              caption: 'Modifier',
              color: Colors.blue,
              icon: Icons.edit_rounded,
              onTap: () {}),
          IconSlideAction(
              caption: 'Annuler',
              color: Colors.red,
              icon: Icons.delete_rounded,
              onTap: () {}),
        ],
        child: ListTile(
          leading: Text(
            rvModel.rvList[itemIndex].objet,
            style: TextStyle(color: Colors.blue),
          ),
          title: Text(rvModel.rvList[itemIndex].structures.nom),
          subtitle: Text(rvModel.rvList[itemIndex].dateRv.toString()),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
        ),
      );
    });
  }
}
