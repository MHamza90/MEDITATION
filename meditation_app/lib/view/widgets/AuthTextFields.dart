import 'package:flutter/material.dart';
import 'package:meditation_app/components/assets.dart';

class AuthTextFields extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  AuthTextFields({
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  });
  @override
  State<AuthTextFields> createState() => _AuthTextFieldsState();
}

class _AuthTextFieldsState extends State<AuthTextFields> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        TextField(
          controller: widget.controller,
          cursorColor: Colors.white,
          obscureText: widget.isPassword ? !_isPasswordVisible : false,
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
                          ? AssetImage(
                              AppImages.eyeOpen,
                            )
                          : AssetImage(AppImages.eyeClosed),
                      color: Color(0xff7F4CD2),
                    ),
                  )
                : null,
          ),
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
