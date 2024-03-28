import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/Helpers/text.dart';
import 'package:meditation_app/View/screens/AddDiary.dart';

import '../../Controllers/DiaryController.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/alertBoxes.dart';

class StatusDiary extends StatefulWidget {
  const StatusDiary({super.key});

  @override
  State<StatusDiary> createState() => _StatusDiaryState();
}

class _StatusDiaryState extends State<StatusDiary> {
  final diaryController = Get.put(DiaryController());
  bool showList = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      diaryController.fetchDiaryList();
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
                    mediumtext(Colors.white, 20, "Дневник состояния"),
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
                          AppImages.image1), // Set the path to your image asset
                      fit: BoxFit
                          .cover, // Set the BoxFit to cover the entire container
                    ),
                  ),
                ),
                vertical(20),
                lighttext(Colors.white, 13,
                    "Дневник состояния - это легкий способ наблюдения за эмоциями и чувствами для глубокого понимания себя"),
                vertical(20),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const AddDiary());
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    lighttext(Colors.white, 14, "Избранные записи"),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        size: 30, color: Color(0xffADADAD))
                  ],
                ),
                vertical(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    lighttext(Colors.white, 14, "Прошлые записи"),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showList = !showList;
                        });
                      },
                      child: Icon(
                        showList == true
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 30,
                        color:
                            showList == true ? Colors.white : Color(0xffADADAD),
                      ),
                    )
                  ],
                ),
                vertical(10),
                // lighttext(const Color(0xffADADAD), 14,
                //     "У вас нет добавленных записей"),
                // vertical(20),
                showList == true
                    ? GetX<DiaryController>(builder: (diaryController) {
                        return diaryController.isLoading.value == true
                            ? Center(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : diaryController.diaryList.isEmpty
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: lighttext(const Color(0xffADADAD),
                                        14, "У вас нет добавленных записей"),
                                  )
                                : ListView.builder(
                                    itemCount: diaryController.diaryList.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: Get.width,
                                            height: 100,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFF2A203B),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Сегодня был хороший день. Утром я проснулась..',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFDFDFDF),
                                                        fontSize: 12,
                                                        fontFamily: 'Ubuntu',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  vertical(20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        '22.09.23',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFADADAD),
                                                          fontSize: 12,
                                                          fontFamily: 'Ubuntu',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              deletePopup(diaryController
                                                                      .diaryList[
                                                                          index]
                                                                      .id
                                                                      .toString(), false);
                                                            },
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: const BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xFF606060)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                              ),
                                                              child: ImageIcon(
                                                                AssetImage(AppImages
                                                                    .deleteIcon),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          horizental(10),
                                                          InkWell(
                                                            onTap: () {
                                                              diaryController.fetchNewDiary(
                                                                  diaryController
                                                                      .diaryList[
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                            },
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: const BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xFF606060)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                              ),
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                    AppImages
                                                                        .editIcon),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          vertical(10)
                                        ],
                                      );
                                    });
                      })
                    : SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
