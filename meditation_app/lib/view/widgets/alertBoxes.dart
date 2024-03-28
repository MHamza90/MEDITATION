import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Controllers/DiaryController.dart';
import '../../Controllers/HabitTrackerController.dart';
import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';

final habitController = Get.put(HabitController());
final diaryController = Get.put(DiaryController());
deletePopup(String id, bool isHabit) {
  Get.dialog(Center(
    child: Container(
      width: 328,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFF22113C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF7F4CD2)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(
                  Colors.white, 12, 'Вы уверены? Удаления нельзя отменить',
                  center: true)),
          vertical(15),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF544370),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Не удалять',
                        style: TextStyle(
                          color: Color(0xFFF0F0F0),
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )),
              horizental(20),
              GestureDetector(
                  onTap: () {
                    if (isHabit == true) {
                      habitController.deleteTracker(id);
                      Get.back();
                    } else {
                      diaryController.deleteDiary(id);
                    }
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3E206B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Удалить',
                        style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    ),
  ));
}

infoPopup() {
  Get.dialog(Center(
    child: Container(
      width: 328,
      height: 284,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFF22113C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF7F4CD2)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.white, 12, 'Для чего этот блок?',
                  center: true)),
          vertical(10),
          Material(
              type: MaterialType.transparency,
              child: lighttext(Colors.white, 10,
                  'Медитация – это комплекс практик, цель которых — повышение осознанности и концентрации. Благодаря таким «ментальным тренировкам»  которым человек может самостоятельно вернуться в ресурсное состояние, перебороть стрессили сосредоточиться на работе.',
                  center: true)),
          vertical(10),
          Material(
              type: MaterialType.transparency,
              child: lighttext(Colors.white, 10,
                  'В данном блоке собраны авторские медитации на разные тематики, помогающие в решении психологических и личностных проблем.',
                  center: true)),
          vertical(20),
          ElevatedButton(
              onPressed: () {
                // Get.to(() => AddDiary());
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
                "Узнать больше о приложении",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    ),
  ));
}

showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    ),
    // barrierDismissible: false,
  );
}

hideLoadingDialog() {
  Get.back();
}

// showExitPopup() {
//   Get.dialog(Center(
//     child: Container(
//       padding: const EdgeInsets.all(20),
//       width: Get.width * 0.9,
//       height: Get.height * 0.3,
//       decoration: ShapeDecoration(
//         color: const Color(0xFF171717),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//       child: Column(
//         children: [
//           Material(
//               type: MaterialType.transparency,
//               child: boldtext(Colors.white, 18, 'Exit App', center: true)),
//           vertical(30),
//           Material(
//             type: MaterialType.transparency,
//             child: mediumtext(Colors.white, 14, 'Do you want to exit App?',
//                 center: true),
//           ),
//           vertical(30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Card(
//                   color: AppColors.gradientLight,
//                   elevation: 15,
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     alignment: Alignment.topLeft,
//                     child: Center(child: boldtext(Colors.white, 14, "No")),
//                   ),
//                 ),
//               ),
//               horizental(20),
//               GestureDetector(
//                 onTap: () {
//                   SystemNavigator.pop();
//                 },
//                 child: Card(
//                   color: AppColors.gradientLight,
//                   elevation: 15,
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     alignment: Alignment.topLeft,
//                     child: Center(child: boldtext(Colors.white, 14, "Yes")),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   ));
// }

// showLogoutPopup() {
//   Get.dialog(Center(
//     child: Container(
//       padding: const EdgeInsets.all(20),
//       width: Get.width * 0.9,
//       height: Get.height * 0.3,
//       decoration: ShapeDecoration(
//         color: const Color(0xFF171717),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//       child: Column(
//         children: [
//           Material(
//               type: MaterialType.transparency,
//               child: boldtext(Colors.white, 18, 'Logout', center: true)),
//           vertical(30),
//           Material(
//             type: MaterialType.transparency,
//             child: mediumtext(Colors.white, 14, 'Do you want to Logout?',
//                 center: true),
//           ),
//           vertical(30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Card(
//                   color: AppColors.gradientLight,
//                   elevation: 15,
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     alignment: Alignment.topLeft,
//                     child: Center(child: boldtext(Colors.white, 14, "No")),
//                   ),
//                 ),
//               ),
//               horizental(20),
//               GestureDetector(
//                 onTap: () {
//                   appStorage.erase();
//                   Get.offAll(() => const SigninScreen());
//                 },
//                 child: Card(
//                   color: AppColors.gradientLight,
//                   elevation: 15,
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     alignment: Alignment.topLeft,
//                     child: Center(child: boldtext(Colors.white, 14, "Yes")),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   ));
// }
