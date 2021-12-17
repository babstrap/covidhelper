import 'package:flutter/material.dart';

class TextviewWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  FormFieldValidator<String> validator;

  TextviewWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator),
    );
  }
}
