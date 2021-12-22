import 'package:covidhelper_mobile/model/utils/networking.dart';
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
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Slidable(
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
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
            child: ListTile(
              leading: Text(
                (Networking.rvList[itemIndex]['objet']) ? "Vaccin" : "Test",
                style: TextStyle(color: Colors.blue),
              ),
              title: Text(
                Networking.rvList[itemIndex]['structures']['nom'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text(Networking.rvList[itemIndex]['date_rv'].toString()),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
      );
    });
  }
}
