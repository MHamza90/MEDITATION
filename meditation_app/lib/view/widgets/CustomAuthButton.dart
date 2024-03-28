import 'package:flutter/material.dart';

class CustomAuthButton extends StatefulWidget {
  final Function()? onPressed;
  final String buttonText;

  CustomAuthButton({this.onPressed, required this.buttonText});

  @override
  State<CustomAuthButton> createState() => _CustomAuthButtonState();
}

class _CustomAuthButtonState extends State<CustomAuthButton> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff22113C),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          width: 2,
          color: Color(0xffC870FE),
        ),
      ),
      child: Text(widget.buttonText),
    );
  }
}