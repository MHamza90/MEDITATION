import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/View/widgets/AuthTextFields.dart';
import 'package:meditation_app/View/widgets/CustomAuthButton.dart';

import '../../../Controllers/ProfileController.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final profileController = Get.find<ProfileController>();
  // bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E0223),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 18, top: 40, right: 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff02A203B),
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          // Handle back button tap
                          // print('Back button tapped');
                          // Add the logic to navigate back or perform any other action
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Смена пароля",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthTextFields(
                        labelText: "Введите старый пароль",
                        isPassword: true,
                        controller: oldPasswordController,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      AuthTextFields(
                        labelText: "Введите новый пароль",
                        isPassword: true,
                        controller: newPasswordController,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      AuthTextFields(
                        labelText: "Подтвердите новый пароль",
                        isPassword: true,
                        controller: confirmPasswordController,
                      ),
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.001),
                      // InkWell(
                      //   onTap: () {
                      //     // Get.to(ResetPassword());
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Expanded(
                      //         child: CustomTextAuth(
                      //           text: "Забыли пароль?",
                      //           fontSize: 14,
                      //           textColor: Colors.white,
                      //           textAlign: TextAlign.right,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      CustomAuthButton(
                          onPressed: () {
                            profileController.changePass(
                                oldPasswordController.text,
                                newPasswordController.text,
                                confirmPasswordController.text);
                          },
                          buttonText: "Сохранить"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
