import 'package:flutter/material.dart';
import 'package:meditation_app/components/assets.dart';

class CustomFormTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  const CustomFormTextFields({
    required this.controller,
    required this.label,
    this.isPassword = false,
  });
  @override
  State<CustomFormTextFields> createState() => _CustomFormTextFieldsState();
}

class _CustomFormTextFieldsState extends State<CustomFormTextFields> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label, // Access label through widget
          style: TextStyle(
            color: Color(0xff939393),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword
              ? !_isPasswordVisible
              : false, // Access controller through widget
          style: TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff0E0223),
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: ImageIcon(
                      _isPasswordVisible
                          ? AssetImage(AppImages.eyeOpen,)
                          : AssetImage(AppImages.eyeClosed),
                          color: Color(0xff3E206B),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
