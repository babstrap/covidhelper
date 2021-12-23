import 'package:flutter/material.dart';

class StatisticsMiniBoxWidget extends StatelessWidget {
  Color boxColor;
  IconData boxIcon;
  int value;
  String title;
  StatisticsMiniBoxWidget(
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
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: boxColor,
            boxShadow: [BoxShadow(color: boxColor, blurRadius: 5.0)]),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
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
            SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomCenter,
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
