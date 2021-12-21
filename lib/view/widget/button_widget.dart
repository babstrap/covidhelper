import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback btnAction;
  String btnText;

  ButtonWidget({Key? key, required this.btnAction, required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      minimumSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );

    return Container(
      child: ElevatedButton(
        onPressed: btnAction,
        child: Text(btnText),
        style: raisedButtonStyle,
      ),
    );
  }
}
