import 'package:covidhelper_mobile/viewmodel/rv_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class AddRvScreen extends StatefulWidget {
  const AddRvScreen({Key? key}) : super(key: key);

  @override
  State<AddRvScreen> createState() => _AddRvScreenState();
}

class _AddRvScreenState extends State<AddRvScreen> {
  late DatePickerController _controller;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = DatePickerController(
        initialDateTime: DateTime.now(),
        minYear: DateTime.now().year,
        maxYear: DateTime.now().year);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  showSnakbar(BuildContext context) {
    return SnackBar(
      content:
          Text("Rendez-vous bien enregistré. \nVoulez-vous être rappelé ?"),
      action: SnackBarAction(
        onPressed: () {
          // Add to calendar
        },
        label: "OK",
      ),
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    RvModel rvModel = Provider.of<RvModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prendre Rendez-vous",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () async {
                await rvModel.addRv();
                // Add to calendar
                ScaffoldMessenger.of(context)
                    .showSnackBar(showSnakbar(context));
              },
              child: Text(
                "Enregistrer",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<RvModel>(builder: (context, rvModel, _) {
          return Form(
              key: rvModel.rvKey,
              child: ListView(children: [
                // Choose structure de santé
                // Give object
                Column(
                  children: [
                    ListTile(
                        title: Text(
                      "Objet",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DropdownButtonFormField(
                      items: rvModel.objectList.map((itemValue) {
                        return DropdownMenuItem(
                            value: itemValue, child: Text(itemValue));
                      }).toList(),
                      value: rvModel.objectSelected,
                      onChanged: (objectId) {
                        print(objectId);
                        rvModel.selectObjet(objectId);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        filled: true,
                        hintText: "Pays",
                      ),
                    ),
                  ],
                ),
                // Give date
                Column(
                  children: [
                    ListTile(
                        title: Text("Date de rendez-vous",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      child: ScrollDatePicker(
                        controller: _controller,
                        locale: DatePickerLocale.fr_fr,
                        pickerDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.blueAccent, width: 2.0),
                        ),
                        config: DatePickerConfig(
                            isLoop: true,
                            selectedTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 17.0)),
                        onChanged: (value) {
                          rvModel.dateSelected = value;
                          print(rvModel.dateSelected.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ]));
        }),
      ),
    );
  }
}
