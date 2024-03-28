import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:meditation_app/controllers/register_controller.dart';
import 'package:meditation_app/View/screens/auth_screens/SigninScreen.dart';
import 'package:meditation_app/View/widgets/CustomFormTextFields.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../../Controllers/Auth/SignupController.dart';
import '../../../Helpers/spacer.dart';
import '../../../components/assets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signupController = Get.put(SignUpController());
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // final registerController = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  /* Error Fields Variables */
  bool isNameValid = false;
  var nameValidationError = '';
  bool isDOBValid = false;
  var DOBValidationError = '';
  bool isEmailValid = false;
  var emailValidationError = '';
  bool isPasswordValid = false;
  var passwordValidationError = '';
  bool isConfirmPasswordValid = false;
  var confirmPasswordValidationError = '';
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
                    text: "Регистрация", fontSize: 26, textColor: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomFormTextFields(
                  controller: nameController,
                  label: 'Имя или никнейм',
                  // validationMessage:
                  //     'Пожалуйста, введите свое имя или никнейм',
                ),
                isNameValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          nameValidationError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomFormTextFields(
                  controller: dateOfBirthController,
                  label: 'Дата рождения',
                  // validationMessage: 'Пожалуйста, введите свое Дата рождения',
                ),
                isDOBValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DOBValidationError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomFormTextFields(
                  controller: emailController,
                  label: 'E-mail',
                  // validationMessage: 'Пожалуйста, введите свое E-mail',
                ),
                isEmailValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          emailValidationError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomFormTextFields(
                  controller: passController,
                  isPassword: true,
                  label: 'Новый пароль',
                  // validationMessage: 'Пожалуйста, введите свое Новый пароль',
                ),
                isPasswordValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          passwordValidationError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomFormTextFields(
                  controller: confirmPasswordController,
                  isPassword: true,
                  label: 'Подтвердите новый пароль',
                  // validationMessage:
                  //     'Пожалуйста, введите свое Подтвердите новый пароль',
                ),
                isConfirmPasswordValid == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          confirmPasswordValidationError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ElevatedButton(
                  onPressed: () {
                    final emailRegex =
                        RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isNameValid = false;
                        isDOBValid = false;
                        isEmailValid = false;
                        isPasswordValid = false;
                        isConfirmPasswordValid = false;
                      });
                      if (nameController.text == '') {
                        setState(() {
                          isNameValid = true;
                          nameValidationError = "Name Field is Required";
                        });
                      } else if (dateOfBirthController.text == '') {
                        setState(() {
                          isDOBValid = true;
                          DOBValidationError =
                              "Date of Birth Field is Required";
                        });
                      } else if (emailController.text == "") {
                        setState(() {
                          isEmailValid = true;
                          emailValidationError = "E-mail Field is Required";
                        });
                      } else if (!emailRegex.hasMatch(emailController.text)) {
                        setState(() {
                          isEmailValid = true;
                          emailValidationError = "Invalid E-mail";
                        });
                      } else if (passController.text == "") {
                        setState(() {
                          isPasswordValid = true;
                          passwordValidationError =
                              "Password Field is Required";
                        });
                      } else if (confirmPasswordController.text == "") {
                        setState(() {
                          isConfirmPasswordValid = true;
                          confirmPasswordValidationError =
                              "Confirm Password Field is Required";
                        });
                      } else if (passController.text !=
                          confirmPasswordController.text) {
                        setState(() {
                          isConfirmPasswordValid = true;
                          confirmPasswordValidationError = "Not Match";
                        });
                      } else {
                        Map<String, dynamic> signup = {
                          'name': nameController.text,
                          'date_of_birth': dateOfBirthController.text,
                          'email': emailController.text,
                          'password': passController.text
                        };
                        signupController.SendSignUp(signup);
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
                              ? const Color(0xFFC870FE)
                              : const Color(0xFF544370)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: isSelected == true
                          ? const Color(0xFFC870FE)
                          : const Color(0xFF544370),
                    ),
                  ),
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      color: isSelected == true
                          ? Colors.white
                          : const Color(0xFF544370),
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                vertical(40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const SigninScreen());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Уже есть аккаунт?',
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
                            text: 'Войти',
                            style: TextStyle(
                              color: Color(0xffC870FE),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                vertical(30),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Нажимая кнопку «Зарегистрироваться»,\nвы соглашаетесь с ',
                          style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          // C870FE
                          text: 'Политикой конфиденциальности',
                          style: TextStyle(
                            color: Color(0xffC870FE),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
