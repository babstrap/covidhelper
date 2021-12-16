import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  String btnText;
  VoidCallback btnAction;
  TextButtonWidget({Key? key, required this.btnAction, required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: btnAction,
      child: Text(btnText),
    );
  }
}
