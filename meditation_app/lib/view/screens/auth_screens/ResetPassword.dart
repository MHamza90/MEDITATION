import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/View/widgets/CustomFormTextFields.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../../Controllers/Auth/ForgetPasswordController.dart';
import '../../../Helpers/spacer.dart';
import '../../../components/assets.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({super.key, required this.email});
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final forgetcodeController = Get.put(ForgetPassController());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  /* Error Fields Variables */
  bool isPasswordValid = false;
  var passwordValidationError = '';
  bool isSelected = false;
  bool isConfirmPasswordValid = false;
  var confirmPasswordValidationError = '';

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
                    text: "Создание нового пароля",
                    fontSize: 20,
                    textColor: Color(0xFFF0F0F0)),
                CustomTextAuth(
                    text:
                        "Придумайте новый пароль для входа в аккаунт \n(он должен содержать не менее 8 символов)",
                    fontSize: 14,
                    textColor: Color(0xFFDFDFDF)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomFormTextFields(
                  controller: newPasswordController,
                  isPassword: true,
                  label: 'Новый пароль',
                  // validationMessage: 'Пожалуйста, введите свое Новый пароль',
                ),
                isPasswordValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${passwordValidationError}',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                CustomFormTextFields(
                  controller: confirmPasswordController,
                  isPassword: true,
                  label: 'Подтвердите новый пароль',
                  // validationMessage: 'Пожалуйста, введите свое Новый пароль',
                ),
                isConfirmPasswordValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${confirmPasswordValidationError}',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : SizedBox.shrink(),
                vertical(40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPasswordValid = false;
                      isConfirmPasswordValid = false;
                      isSelected = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      if (newPasswordController.text == "") {
                        setState(() {
                          isPasswordValid = true;
                          passwordValidationError = 'New Password is required';
                        });
                      } else if (confirmPasswordController.text == "") {
                        setState(() {
                          isConfirmPasswordValid = true;
                          confirmPasswordValidationError =
                              'Confirm Password field is required ';
                        });
                      } else if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        setState(() {
                          isConfirmPasswordValid = true;
                          confirmPasswordValidationError = "Not Match";
                        });
                      } else {
                        forgetcodeController.sendPassword(
                          widget.email,
                          newPasswordController.text,
                        );
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
                    'Отправить',
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
