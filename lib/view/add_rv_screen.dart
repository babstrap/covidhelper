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
        maxYear: 2050);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  showSnakbar(BuildContext context) {
    return SnackBar(
      content: Text("Voulez-vous être rappelé ?"),
      action: SnackBarAction(
        onPressed: () {
          // Add to calendar
        },
        label: "OK",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RvModel rvModel = Provider.of<RvModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Prendre Rendez-vous"),
        centerTitle: true,
        elevation: 0,
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
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Center(
        child: Consumer<RvModel>(builder: (context, rvModel, _) {
          return Form(
              key: rvModel.rvKey,
              child: ListView(children: [
                // Choose structure de santé
                // Give object
                DropdownButton(
                    hint: Text("Objet"),
                    items: rvModel.objectList.map((itemValue) {
                      return DropdownMenuItem(
                          value: itemValue, child: Text(itemValue));
                    }).toList(),
                    value: rvModel.objectSelected,
                    onChanged: (objectId) {
                      print(objectId);
                      rvModel.selectObjet(objectId);
                    }),
                // Give date
                ScrollDatePicker(
                  controller: _controller,
                  locale: DatePickerLocale.fr_fr,
                  pickerDecoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2.0)),
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
              ]));
        }),
      ),
    );
  }
}
