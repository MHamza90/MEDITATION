import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meditation_app/View/widgets/CustomFormTextFields.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../../Controllers/Auth/ForgetPasswordController.dart';
import '../../../Helpers/spacer.dart';
import '../../../components/assets.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final forgetcodeController = Get.put(ForgetPassController());
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEmailValid = false;
  bool isSelected = false;
  var emailValidationError = '';
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = TextEditingController();
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
                    fontSize: 24,
                    textColor: Colors.white),
                CustomTextAuth(
                    text:
                        "Введите свой E-mail и мы отправим на него код для восстановления пароля",
                    fontSize: 16,
                    textColor: Colors.white),
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
                        forgetcodeController.Getforgetotp(emailController.text);
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
