import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/components/assets.dart';

import 'package:meditation_app/View/screens/auth_screens/ChangePassword.dart';

import '../../Controllers/ProfileController.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  bool isHabitDispaly = false;
  bool isMeditationReminder = false;
  bool isHabitReminder = false;
  final profileController = Get.put(ProfileController());

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = profileController.userProfile?.id != null
        ? profileController.userProfile!.name ?? ""
        : "";
    dateController.text = profileController.userProfile?.id != null
        ? profileController.userProfile!.dateOfBirth ?? ""
        : "";
    emailController.text = profileController.userProfile?.id != null
        ? profileController.userProfile!.email ?? ""
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E0223),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          size: 18,
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    const Text(
                      'Настройки аккаунта',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 14,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Имя или никнейм",
                    style: TextStyle(
                      color: Color(0xff939393),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      suffixIcon: ImageIcon(
                    AssetImage(AppImages.editIcon),
                    color: Color(0xff7F4CD2),
                  )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Дата рождения",
                    style: TextStyle(
                      color: Color(0xff939393),
                    ),
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      suffixIcon: ImageIcon(
                    AssetImage(AppImages.editIcon),
                    color: Color(0xff7F4CD2),
                  )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "E-mail",
                    style: TextStyle(
                      color: Color(0xff939393),
                    ),
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: ImageIcon(
                        AssetImage(AppImages.editIcon),
                        color: Color(0xff7F4CD2),
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const ChangePassword());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff22113C),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xffC870FE),
                      ),
                    ),
                    child: const Text(
                      "Сменить пароль",
                      style: TextStyle(color: Colors.white),
                    )),
                vertical(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Отображать привычки на главной странице",
                      style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    CupertinoSwitch(
                      value: isHabitDispaly,
                      onChanged: (value) {
                        isHabitDispaly = value;
                        if (value) {
                        } else {}
                        setState(
                          () {},
                        );
                      },
                      thumbColor: const Color(0xffD9D9D9),
                      activeColor: const Color(0xFF8C41FE),
                      trackColor: const Color(0xFFF7A7A7A),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Присылать напоминания о медитациях",
                      style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    CupertinoSwitch(
                      value: isMeditationReminder,
                      onChanged: (value) {
                        isMeditationReminder = value;
                        if (value) {
                        } else {}
                        setState(
                          () {},
                        );
                      },
                      thumbColor: const Color(0xffD9D9D9),
                      activeColor: const Color(0xFF8C41FE),
                      trackColor: const Color(0xFFF7A7A7A),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Присылать напоминания о привычках",
                      style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    CupertinoSwitch(
                      value: isHabitReminder,
                      onChanged: (value) {
                        isHabitReminder = value;
                        if (value) {
                        } else {}
                        setState(
                          () {},
                        );
                      },
                      thumbColor: const Color(0xffD9D9D9),
                      activeColor: const Color(0xFF8C41FE),
                      trackColor: const Color(0xFFF7A7A7A),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                ElevatedButton(
                    onPressed: () {
                      profileController.updateProfile(
                          nameController.text, dateController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E206B),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xff3E206B),
                      ),
                    ),
                    child: const Text(
                      "Сохранить",
                      style: TextStyle(
                          color: Color(0xFFF0F0F0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
