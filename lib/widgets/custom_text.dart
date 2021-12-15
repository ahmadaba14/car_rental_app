import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  final double height;

  final FontWeight fontWeight;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = const Color.fromARGB(255, 25, 51, 97),
    this.alignment = Alignment.topLeft,
    this.height = 1,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
