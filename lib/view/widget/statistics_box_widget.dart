import 'package:flutter/material.dart';

class StatisticsBoxWidget extends StatelessWidget {
  Color boxColor;
  IconData boxIcon;
  int value;
  String title;
  StatisticsBoxWidget(
      {Key? key,
      required this.boxColor,
      required this.boxIcon,
      required this.value,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: boxColor,
            boxShadow: [BoxShadow(color: boxColor, blurRadius: 5.0)]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 40,
                child: Text(
                  value.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                backgroundColor: Colors.white.withOpacity(.2),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
