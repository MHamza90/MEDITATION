import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/components/assets.dart';
import 'package:meditation_app/View/widgets/CustomFormTextFields.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../../Controllers/Auth/ForgetPasswordController.dart';

// ignore: must_be_immutable
class VerificationCodeScreen extends StatefulWidget {
  String email;
  VerificationCodeScreen({super.key, required this.email});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final forgetcodeController = Get.put(ForgetPassController());
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  /* Validation Variables */
  final _formKey = GlobalKey<FormState>();
  bool isEmailValid = false;
  bool isCodeValid = false;
  bool isSelected = false;
  var emailValidationError = '';
  var codeValidationError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff0E0223),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(AppImages.logo)),
                vertical(20),
                CustomTextAuth(
                    text: "Сброс пароля",
                    fontSize: 20,
                    textColor: Color(0xFFF0F0F0)),
                vertical(20),
                CustomTextAuth(
                    text:
                        "Введите свой E-mail и мы отправим\nна него код для восстановления пароля",
                    fontSize: 14,
                    textColor: Color(0xFFDFDFDF)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomFormTextFields(
                  controller: emailController,
                  label: 'E-mail',
                  // validationMessage: 'Пожалуйста, введите свое E-mail',
                ),
                isEmailValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${emailValidationError}',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CustomFormTextFields(
                  controller: codeController,
                  label: 'Код из письма',
                  // validationMessage: 'Пожалуйста, введите свое E-mail',
                ),
                isCodeValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${codeValidationError}',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEmailValid = false;

                      isSelected = true;
                    });
                    final emailRegex =
                        RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (_formKey.currentState!.validate()) {
                      if (emailController.text == "") {
                        setState(() {
                          isEmailValid = true;
                          emailValidationError = 'E-mail is required';
                        });
                      } else if (!emailRegex.hasMatch(emailController.text)) {
                        setState(() {
                          isEmailValid = true;
                          emailValidationError = 'Invalid E-mail ';
                        });
                      } else {
                        forgetcodeController.verifyotp(
                            emailController.text, codeController.text);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected == true
                        ? Color(0xff3E206B)
                        : Color(0xFF22113C),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Сбросить пароль',
                    style: TextStyle(
                      color:
                          isSelected == true ? Colors.white : Color(0xFF544370),
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
