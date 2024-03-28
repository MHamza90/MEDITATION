import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/components/assets.dart';
import 'package:meditation_app/View/screens/auth_screens/EmailVerify.dart';
import 'package:meditation_app/View/screens/auth_screens/SignupScreen.dart';
import 'package:meditation_app/View/widgets/CustomFormTextFields.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../../Controllers/Auth/SignInController.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final signIncontroller = Get.put(SignInController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  /* Text Validate Variables */
  bool isEmailValid = false;
  var emailValidationError = '';
  bool isPasswordValid = false;
  var passwordValidationError = '';
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff0E0223),
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
                    text: "Авторизация",
                    fontSize: 20,
                    textColor: Color(0xFFF0F0F0)),
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
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomFormTextFields(
                  controller: passController,
                  isPassword: true,
                  label: 'пароль',
                  // validationMessage: 'Пожалуйста, введите свое пароль',
                ),
                isPasswordValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${passwordValidationError}',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                InkWell(
                  onTap: () {
                    Get.to(() => EmailVerify());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextAuth(
                          text: "Забыли пароль?",
                          fontSize: 12,
                          textColor: const Color(0xFFDFDFDF),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEmailValid = false;
                      isPasswordValid = false;
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
                      } else if (passController.text == "") {
                        setState(() {
                          isPasswordValid = true;
                          passwordValidationError =
                              'Password field is required ';
                        });
                      } else {
                        signIncontroller.SendLogin(
                          emailController.text,
                          passController.text,
                        );
                        print('Click Login');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22113C),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: isSelected == true ? 2 : 1,
                          color: isSelected == true
                              ? Color(0xFFC870FE)
                              : Color(0xFF544370)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: isSelected == true
                          ? Color(0xFFC870FE)
                          : Color(0xFF544370),
                    ),
                  ),
                  child: Text(
                    'Войти',
                    style: TextStyle(
                      color:
                          isSelected == true ? Colors.white : Color(0xFF544370),
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    print('Click For Sign Google');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3E206B),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Set border radius to zero
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Войти через Google Account",
                        style: TextStyle(color: Colors.white),
                      ),
                      Image(
                        image: AssetImage(AppImages.googleIcon),
                        height: 50,
                      ),
                      // ImageIcon(AppImages.googleIcon),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Нет аккаунта?',
                            style: TextStyle(
                              color: Color(0xFFDFDFDF),
                              fontSize: 12,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                                width:
                                    8), // Adjust the width for the desired space
                          ),
                          TextSpan(
                            // C870FE
                            text: 'Зарегистрируйтесь',
                            style: TextStyle(
                              color: Color(0xFFC870FE),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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
