import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/View/screens/MediaPlay.dart';

import '../../Helpers/text.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/alertBoxes.dart';

class MeditationsAndPractices extends StatefulWidget {
  const MeditationsAndPractices({super.key});

  @override
  State<MeditationsAndPractices> createState() =>
      _MeditationsAndPracticesState();
}

class _MeditationsAndPracticesState extends State<MeditationsAndPractices> {
  List<bool> isSelectedList = List.generate(12, (index) => false);
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xff0E0223),
            appBar: CustomAppBar(),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mediumtext(
                                  Colors.white, 20, "Медитации и практики"),
                              InkWell(
                                onTap: () {
                                  infoPopup();
                                },
                                child: const Icon(
                                  Icons.help_outline_rounded,
                                  color: Color(0xffE0A3FF),
                                ),
                              )
                            ],
                          ),
                          vertical(20),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return MySelectableContainer(
                                  isSelected: isSelectedList[index],
                                  onTap: () {
                                    setState(() {
                                      isSelectedList[index] =
                                          !isSelectedList[index];
                                    });
                                  },
                                  text: itemList[index],
                                );
                              },
                            ),
                          ),
                          vertical(20),
                          InkWell(
                            onTap: () {
                              // Get.to(() => HabitTracker());
                            },
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Set the border radius for rounded corners
                                image: DecorationImage(
                                  image: AssetImage(AppImages
                                      .homeCard3), // Set the path to your image asset
                                  fit: BoxFit
                                      .cover, // Set the BoxFit to cover the entire container
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff22113C),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "10 мин",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                        Container(
                                          height: 35,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff22113C),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Align(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.bookmark,
                                                color: Color(0xff7F4CD2),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF22113C),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius for all corners
                                        border: const Border(
                                          left: BorderSide(
                                            color: Color(
                                                0xFFC870FE), // Set the color for the left border
                                            width: 1.0,
                                          ),
                                          top: BorderSide(
                                            color: Color(
                                                0xFFC870FE), // Set the color for the top border
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            width: 210,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Намерение на день",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Text(
                                                  "Утренняя медитация «Намерение на день» положительно влияет на самочувствие и настроение",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => MediaPlay());
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color(
                                                        0xffC870FE), // Set the border color
                                                    width:
                                                        2.0, // Set the border width
                                                  ),
                                                  color:
                                                      const Color(0xff3E206B),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Image(
                                                    image: AssetImage(
                                                        AppImages.playIcon)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          vertical(30),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Денежная медитация',
                                          style: TextStyle(
                                            color: Color(0xFFF9F9F9),
                                            fontSize: 14,
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              '40 мин',
                                              style: TextStyle(
                                                color: Color(0xFFDFDFDF),
                                                fontSize: 12,
                                                fontFamily: 'Ubuntu',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            horizental(20),
                                            Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color(
                                                        0xffC870FE), // Set the border color
                                                    width:
                                                        2.0, // Set the border width
                                                  ),
                                                  color:
                                                      const Color(0xff3E206B),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Image(
                                                image: AssetImage(
                                                  AppImages.playIcon,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xFF544370),
                                      thickness: 2,
                                    ),
                                  ],
                                );
                              })
                        ])))));
  }
}

class MySelectableContainer extends StatelessWidget {
  final String text;

  final bool isSelected;
  final VoidCallback onTap;

  MySelectableContainer({
    required this.isSelected,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          width: 104,
          height: 40,
          decoration: ShapeDecoration(
            color: const Color(0xFF3E206B),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF7F4CD2),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
