import 'package:flutter/material.dart';
import 'package:meditation_app/components/assets.dart';

class AuthLogoText extends StatelessWidget {
  const AuthLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(AppImages.starImage),
          height: 40,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Text(
          "Level Up",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}