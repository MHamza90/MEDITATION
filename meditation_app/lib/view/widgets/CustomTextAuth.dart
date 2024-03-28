import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;

  CustomTextAuth({
    required this.text,
    this.textColor,
    this.fontSize,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize ?? 16, color: textColor),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
