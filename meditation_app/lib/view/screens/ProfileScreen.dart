import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/components/ApiUrls.dart';
import 'package:meditation_app/components/assets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:meditation_app/View/screens/AccountSettingScreen.dart';
import 'package:meditation_app/View/widgets/CustomTextAuth.dart';

import '../../Controllers/ProfileController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  String? selectedAvatar;
  var avatarselectedID;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.fetchUserProfile();
      profileController.fetchAvatarList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E0223),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff02A203B),
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        profileController.userProfile?.avatar != null
                            ? InkWell(
                                onTap: () {
                                  showAvatarBottomSheet(context);
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  // Default color
                                  child: ClipOval(
                                    child: Image(
                                      height: 95,
                                      image: NetworkImage(
                                          '${AppUrl.impath}${profileController.userProfile?.avatar.toString()}'),
                                    ),
                                  ),
                                ),
                              )
                            : DottedBorder(
                                color: Colors.white,
                                dashPattern: [8, 4],
                                strokeWidth: 2,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showAvatarBottomSheet(context);
                                        // print(
                                        //     '${AppUrl.impath}/${profileController.avatarList.length}');
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                                AppImages.defaultAvatar),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          "${profileController.userProfile?.name ?? ""}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff02A203B),
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                          onTap: () {
                            // Handle back button tap
                            print('Edit button tapped');
                            // Add the logic to navigate back or perform any other action
                          },
                          child: Image(
                              color: Colors.white,
                              height: 20,
                              image: AssetImage(AppImages.editIcon))),
                    ),
                  ],
                ),
                vertical(40),
                const Text("Моя статистика",
                    style: TextStyle(
                      color: Color(0xff0E0A3FF),
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    )),
                vertical(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 178,
                      height: 148,
                      decoration: ShapeDecoration(
                        color: Color(0xFF22113C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Добавлено привычек",
                                    style: TextStyle(
                                      color: Color(0xFFF0F0F0),
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        color: Color(0xff0E0A3FF),
                                        fontSize: 40),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                            vertical(10),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3E206B),
                                  minimumSize: const Size(double.infinity, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xff3E206B),
                                  ),
                                ),
                                child: const Text(
                                  "Добавить",
                                  style: TextStyle(
                                    color: Color(0xFFF0F0F0),
                                    fontSize: 12,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 178,
                      height: 148,
                      decoration: ShapeDecoration(
                        color: Color(0xFF22113C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Открыто кард дня",
                                    style: TextStyle(
                                      color: Color(0xFFF0F0F0),
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        color: Color(0xff0E0A3FF),
                                        fontSize: 40),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                            vertical(10),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3E206B),
                                  minimumSize: const Size(double.infinity, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xff3E206B),
                                  ),
                                ),
                                child: const Text(
                                  "Открыть",
                                  style: TextStyle(
                                    color: Color(0xFFF0F0F0),
                                    fontSize: 12,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                vertical(10),
                Container(
                  width: Get.width,
                  height: 136,
                  decoration: ShapeDecoration(
                    color: Color(0xFF22113C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Прослушано медитаций\nза все время',
                                style: TextStyle(
                                  color: Color(0xFFF0F0F0),
                                  fontSize: 12,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "0",
                                style: TextStyle(
                                    color: Color(0xff0E0A3FF), fontSize: 40),
                                textAlign: TextAlign.right,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Get.to(() => HomePage());
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
                              "Слушать",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Настройки акаунта и смена пароля',
                      style: TextStyle(
                        color: Color(0xFFF0F0F0),
                        fontSize: 14,
                        fontFamily: 'Roboto Flex',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff3E206B),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const AccountSettingScreen());
                          // Handle back button tap
                          // print('Back button tapped11');
                          // Add the logic to navigate back or perform any other action
                        },
                        child: const Icon(
                          size: 18,
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  color: Color(0xff544370),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Как использовать приложение?',
                      style: TextStyle(
                        color: Color(0xFFF0F0F0),
                        fontSize: 14,
                        fontFamily: 'Roboto Flex',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff3E206B),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {
                          // Handle back button tap
                          print('Back button tapped');
                          // Add the logic to navigate back or perform any other action
                        },
                        child: const Icon(
                          size: 18,
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  color: Color(0xff544370),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Сайт Лили Аспен',
                      style: TextStyle(
                        color: Color(0xFFF0F0F0),
                        fontSize: 14,
                        fontFamily: 'Roboto Flex',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff3E206B),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {
                          // Handle back button tap
                          print('Back button tapped');
                          // Add the logic to navigate back or perform any other action
                        },
                        child: const Icon(
                          size: 18,
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  color: Color(0xff544370),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      print("Clicked");
                      // Get.to(ResetPassword());
                    },
                    child: CustomTextAuth(
                      text: "Выйти из аккаунта",
                      fontSize: 12,
                      textColor: Color(0xFF939393),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextAuth(
                    text:
                        "Политика конфиденциальности \nСогласие на обработку персональных данных",
                    fontSize: 10,
                    textColor: Color(0xFF939393),
                  ),
                ),
                vertical(30)
              ],
            ),
          ),
        ),
      ),
    );
  }

// DOTTED BORDER
  Widget get rectBorderWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 200,
        width: 120,
        color: Colors.white,
      ),
    );
  }

  void showAvatarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => buildAvatarList(context),
      backgroundColor: const Color(0xff0E0223),
    );
  }

  Widget buildAvatarList(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xff0E0223),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          border: Border(
            top: BorderSide(
              color: Color(
                  0xFF3E206B), // Change this color to your desired top border color
              width: 2.0, // Adjust the width as needed
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 64,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3E206B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(95),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Выберите аватар для профиля',
                  style: TextStyle(
                    color: Color(0xFFF9F9F9),
                    fontSize: 16,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              vertical(20),
              Expanded(
                  child: Wrap(
                children: profileController.avatarList.map((i) {
                  return InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        selectedAvatar = i.path;
                      });
                      profileController.addAvatarValues(selectedAvatar ?? "");
                      print(selectedAvatar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: selectedAvatar == i.path
                            ? const Color(0xFF3E206B) // Selected color
                            : Colors.transparent, // Default color
                        child: ClipOval(
                          child: Image(
                            height: 95,
                            image: NetworkImage('${AppUrl.impath}/${i.path}'),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
              // Expanded(
              //   child: GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //       crossAxisSpacing: 22,
              //       mainAxisSpacing: 22,
              //     ),
              //     itemCount: avatarUrls.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           // Handle avatar tap
              //           Navigator.pop(context); // Close the bottom sheet
              //         },
              //         child: CircleAvatar(
              //             backgroundColor: const Color(0xFF3E206B),
              //             child: ClipOval(
              //               child: Image(
              //                 image: AssetImage(
              //                   avatarUrls[index],
              //                 ),
              //               ),
              //             )),
              //       );
              //     },
              //   ),
              // ),
              vertical(10),
              ElevatedButton(
                  onPressed: () {
                    profileController
                        .updateAvatar("${profileController.avatarSelected}");
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
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      );
    });
  }

  // Widget avatar(BuildContext context) {
  //   return Wrap(
  //     children: profileController.avatarList.map((i) {
  //       return InkWell(
  //         onTap: () {
  //           FocusScope.of(context).requestFocus(FocusNode());
  //           setState(() {
  //             selectedAvatar = i.path;
  //           });
  //           profileController.addAvatarValues(selectedAvatar ?? "");
  //           print(selectedAvatar);
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
  //           child: CircleAvatar(
  //             radius: 50,
  //             backgroundColor: selectedAvatar == i.path
  //                 ? const Color(0xFF3E206B) // Selected color
  //                 : Colors.transparent, // Default color
  //             child: ClipOval(
  //               child: Image(
  //                 height: 95,
  //                 image: NetworkImage('${AppUrl.impath}/${i.path}'),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }
}
