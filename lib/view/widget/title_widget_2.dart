import 'package:flutter/material.dart';

class TitleWidget2 extends StatelessWidget {
  String title;
  Widget subTitle;
  TitleWidget2({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: subTitle,
    );
  }
}
