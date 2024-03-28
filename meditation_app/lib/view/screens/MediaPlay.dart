import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Helpers/spacer.dart';
import 'package:meditation_app/Helpers/text.dart';

import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';

class MediaPlay extends StatefulWidget {
  const MediaPlay({super.key});

  @override
  State<MediaPlay> createState() => _MediaPlayState();
}

class _MediaPlayState extends State<MediaPlay> {
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
                              const Text(
                                'Новая запись..',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 14,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 2, color: Color(0xFF7F4CD2)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Color(0xFF7F4CD2),
                                ),
                              ),
                            ],
                          ),
                          vertical(30),
                          Container(
                            height: 150,
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
                          ),
                          vertical(20),
                          Center(
                              child: Image(
                                  image: AssetImage(AppImages.PlayerActive))),
                          vertical(20),
                          Container(
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
                            child: lighttext(
                                Colors.white,
                                13,
                                center: true,
                                "Утренняя медитация «Намерение на день» положительно влияет на самочувствиеи настроение. Она поможет вам настроиться на предстоящий день и провести его максимально осознанно и эффективно, а также задать позитивный вектор мышления и развития"),
                          ),
                          vertical(20),
                          Center(
                            child: lighttext(Colors.white, 13,
                                "В чем может помочь эта медитация?",
                                center: true),
                          ),
                          vertical(20),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(AppImages.icon2),
                                color: Color(0xff7F4CD2),
                              ),
                              horizental(10),
                              lighttext(Colors.white, 13,
                                  "Запустить правильную циркуляцию энергии")
                            ],
                          ),
                          vertical(20),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(AppImages.icon2),
                                color: Color(0xff7F4CD2),
                              ),
                              horizental(10),
                              lighttext(Colors.white, 13,
                                  "Провести весь день в состоянии осознанности")
                            ],
                          ),
                          vertical(20),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(AppImages.icon2),
                                color: Color(0xff7F4CD2),
                              ),
                              horizental(10),
                              lighttext(Colors.white, 13,
                                  "Стать устойчивее к стрессам и внешним триггерам")
                            ],
                          ),
                          vertical(20),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(AppImages.icon2),
                                color: Color(0xff7F4CD2),
                              ),
                              horizental(10),
                              lighttext(Colors.white, 13,
                                  "Стать устойчивее к стрессам и внешним триггерам")
                            ],
                          ),
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
                                "Все медитации",
                                style: TextStyle(color: Colors.white),
                              )),
                        ])))));
  }
}
