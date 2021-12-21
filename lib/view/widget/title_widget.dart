import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title;
  TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width / 13),
    );
  }
}
