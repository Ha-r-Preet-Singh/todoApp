import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  double fSize;
  FontWeight fWeight;
  String? fFamily;
  Color fColor;

  CustomText({
    required this.title,
    required this.fSize,
    required this.fWeight,
     this.fFamily,
    required this.fColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fSize,
          fontWeight: fWeight,
          fontFamily: fFamily,
          color: fColor),
    );
  }
}
