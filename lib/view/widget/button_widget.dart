import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback btnAction;
  String btnText;

  ButtonWidget({Key? key, required this.btnAction, required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: btnAction,
        child: Text(btnText),
      ),
    );
  }
}
