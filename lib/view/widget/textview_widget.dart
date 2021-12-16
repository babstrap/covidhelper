import 'package:flutter/material.dart';

class TextviewWidget extends StatelessWidget {
  String hintText;

  TextviewWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: (value) {
          if (value!.trim().isEmpty) return "Ce champs est obligatoire";
        },
      ),
    );
  }
}
