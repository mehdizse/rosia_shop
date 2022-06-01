import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  const TextUtil(
      {required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.decoration,
      Key? key})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
