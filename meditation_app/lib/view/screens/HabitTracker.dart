import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Controllers/HabitTrackerController.dart';
import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';
import '../../components/ApiUrls.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/alertBoxes.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  final habitController = Get.put(HabitController());
  TextEditingController descriptionController = TextEditingController();
  List<bool> isSelectedList = List.generate(12, (index) => false);
  List<bool> isIconList = List.generate(12, (index) => false);
  List<String> itemList = [
    'Ежедневно',
    'x3 в неделю',
    'x2 в неделю',
    'Ежедневно',
    'x3 в неделю',
    'x2 в неделю',
    'Ежедневно',
    'x3 в неделю',
    'x2 в неделю',
    'Ежедневно',
    'x3 в неделю',
    'x2 в неделю',
  ];
  List<String> iconList = [
    AppImages.icon1,
    AppImages.icon2,
    AppImages.icon3,
    AppImages.icon4,
    AppImages.icon5,
    AppImages.icon6,
    AppImages.icon7,
    AppImages.icon8,
  ];
  bool isMeditationReminder = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      habitController.fetchExecutionList();
      habitController.fetchHabitList();
      habitController.fetchTracker();
      descriptionController.text = habitController.showTracker?.id != null
        ? habitController.showTracker?.name ?? ''
        : '';
    // ignore: unnecessary_null_comparison
  //   selectedIndex == addDiaryController.showNewDiary?.emotions
  //           ?.map((e) => e.name.toString())
  //           .toList() ??
  //       [];
  //  selectedIcon == habitController.showTracker?.id != null
  //       ? habitController.showTracker?.name ?? ''
  //       : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E0223),
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mediumtext(Colors.white, 20, "Трекер привычек"),
                    const Icon(
                      Icons.help_outline_rounded,
                      color: Color(0xffE0A3FF),
                    )
                  ],
                ),
                vertical(20),
                Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          AppImages.image2), // Set the path to your image asset
                      fit: BoxFit
                          .cover, // Set the BoxFit to cover the entire container
                    ),
                  ),
                ),
                vertical(20),
                lighttext(Colors.white, 13,
                    "Трекер помогает в выработке дисциплины и создании  правильной рутины, а также для мониторинга прогресса"),
                vertical(20),
                Container(
                    width: Get.width,
                    height: 70,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF2A203B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: ListTile(
                      leading: Container(
                          width: 36,
                          height: 36,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFF544370)),
                            ),
                          ),
                          child: const Icon(
                            Icons.water_drop_outlined,
                            color: Color(0xFF544370),
                          )),
                      title: const Text(
                        'Пить 2 литра воды',
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 14,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text(
                        'Ежедневно',
                        style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Container(
                        width: 36,
                        height: 36,
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF544370),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Color(0xff2A203B),
                        ),
                      ),
                    )),
                vertical(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Отображать привычки на главной",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
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
                vertical(30),
                ElevatedButton(
                    onPressed: () {
                      showAvatarBottomSheet(context);
                      // Get.to(() => const AddDiary());
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
                      "Добавить новую запись",
                      style: TextStyle(color: Colors.white),
                    )),
                vertical(20),
              ],
            ),
          ),
        ),
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

  String selectedIndex = "";
  String selectedIcon = "";
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3E206B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(95),
                    ),
                  ),
                ),
                vertical(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Редактирование привычки',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                    habitController.showTracker?.id != null
                        ? InkWell(
                            onTap: () {
                              deletePopup(
                                  habitController.showTracker!.id.toString(),
                                  true);
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF606060)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: ImageIcon(
                                AssetImage(AppImages.deleteIcon),
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                vertical(30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Название привычки',
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
                SizedBox(
                  width: Get.width,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: descriptionController,
                    // enabled: isEnabled,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        contentPadding: EdgeInsets.only(left: 10, top: 15),
                        // hintText: hint,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Пить два литра воды в день"),
                  ),
                ),
                vertical(30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Регулярность выполнения',
                    style: TextStyle(
                      color: Color(0xFFF9F9F9),
                      fontSize: 14,
                      fontFamily: 'Roboto Flex',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                vertical(20),
                //yeh he
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: habitController.executionList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex ==
                                habitController.executionList[index].id
                                    .toString()) {
                              selectedIndex = "";
                              print(
                                  'Deselected: '); // Deselect if already selected
                            } else {
                              selectedIndex = habitController
                                  .executionList[index].id
                                  .toString();

                              print(selectedIndex);
                              print('Selected  $selectedIndex: ');
                              // Select the item
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 104,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: habitController.executionList[index].id
                                          .toString() ==
                                      selectedIndex
                                  ? const Color(0xFF3E206B)
                                  : const Color(0xFF22113C),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: habitController.executionList[index].id
                                              .toString() ==
                                          selectedIndex
                                      ? const Color(0xFF7F4CD2)
                                      : const Color(0xFF3E206B),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${habitController.executionList[index].name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                vertical(30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Иконка для привычки',
                    style: TextStyle(
                      color: Color(0xFFF9F9F9),
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                vertical(20),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: habitController.habitList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIcon ==
                                habitController.habitList[index].id
                                    .toString()) {
                              selectedIcon = "";
                              print(
                                  'Deselected: '); // Deselect if already selected
                            } else {
                              selectedIcon = habitController.habitList[index].id
                                  .toString();

                              // Select the item
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: habitController.habitList[index].id
                                          .toString() ==
                                      selectedIcon
                                  ? const Color(0xFF3E206B)
                                  : const Color(0xFF22113C),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: habitController.habitList[index].id
                                              .toString() ==
                                          selectedIcon
                                      ? const Color(0xFF7F4CD2)
                                      : const Color(0xFF3E206B),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: ImageIcon(
                                NetworkImage(
                                    '${AppUrl.impath}/${habitController.habitList[index].image.toString()}'),
                                color: habitController.habitList[index].id
                                            .toString() ==
                                        selectedIcon
                                    ? const Color(0xFFC870FE)
                                    : const Color(0xFF7F4CD2),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                vertical(30),
                ElevatedButton(
                    onPressed: () {
                      habitController.addTracker(descriptionController.text,
                          selectedIndex, selectedIcon);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E206B),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xff3E206B),
                      ),
                    ),
                    child: const Text(
                      "Сохранить привычку",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// class MySelectableContainer extends StatelessWidget {
//   final String text;

//   final bool isSelectedText;
//   final VoidCallback onTap;

//   MySelectableContainer({
//     required this.isSelectedText,
//     required this.onTap,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 5),
//         child: Container(
//           width: 104,
//           height: 40,
//           decoration: ShapeDecoration(
//             color: const Color(0xFF3E206B),
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(
//                 width: 1,
//                 color: Color(0xFF7F4CD2),
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MySelectableIcon extends StatelessWidget {
//   final String image;

//   final bool isSelected;
//   final VoidCallback onTap;

//   MySelectableIcon({
//     required this.isSelected,
//     required this.onTap,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 5),
//         child: Container(
//           width: 40,
//           height: 40,
//           decoration: ShapeDecoration(
//             color: Color(0xFF22113C),
//             shape: RoundedRectangleBorder(
//               side: BorderSide(width: 2, color: Color(0xFF3E206B)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           child: Center(
//               child: ImageIcon(
//             AssetImage(image),
//             color: Color(0xff7F4CD2),
//           )),
//         ),
//       ),
//     );
//   }
// }
