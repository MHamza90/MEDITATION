import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<String> textList = [
    "Что такое Level Up?",
    "Для чего нужен дневник состояния?",
    "Как пользоваться трекером привычек?",
    "Что такое карта дня?",
    "Для чего нужно медитировать?",
    "Как в первый раз начать медитацию?",
    "Как помочь себе сконцентрироваться?",
    "Частые ошибки новичков",

    // Add more avatar URLs as needed
  ];
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
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF2A203B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        horizental(30),
                        const Text(
                          'Как пользоваться Level Up?',
                          style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    vertical(30),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages
                              .image5), // Set the path to your image asset
                          fit: BoxFit
                              .cover, // Set the BoxFit to cover the entire container
                        ),
                      ),
                    ),
                    vertical(20),
                    lighttext(Colors.white, 12,
                        "На этой странице собраны описания разделов \nприложения и их функционал, рекомендации \nдля начала работы и ответы на частые вопросы"),
                    vertical(30),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: textList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  lighttext(
                                      Colors.white, 14, textList[index]),
                                  const Icon(Icons.keyboard_arrow_down_rounded,
                                      size: 30, color: Color(0xffADADAD))
                                ],
                              ),
                              const Divider(
                                height: 30,
                                thickness: 2,
                                color: Color(0xff544370),
                              ),
                            ],
                          );
                        })
                  ],
                ),
              ),
            )));
  }
}
