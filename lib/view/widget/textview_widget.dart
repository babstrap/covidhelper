import 'package:flutter/material.dart';

class TextviewWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  Icon prefixIcon;

  TextviewWidget(
      {Key? key,
      required this.prefixIcon,
      required this.hintText,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.34),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(5),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          validator: validator),
    );
  }
}
