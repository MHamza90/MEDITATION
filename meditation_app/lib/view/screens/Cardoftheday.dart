import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/View/screens/OpenCard.dart';

import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';

class Cardoftheday extends StatefulWidget {
  const Cardoftheday({super.key});

  @override
  State<Cardoftheday> createState() => _CardofthedayState();
}

class _CardofthedayState extends State<Cardoftheday> {
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
                    mediumtext(Colors.white, 20, "Карта дня"),
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
                          AppImages.image3), // Set the path to your image asset
                      fit: BoxFit
                          .cover, // Set the BoxFit to cover the entire container
                    ),
                  ),
                ),
                vertical(20),
                lighttext(Colors.white, 13,
                    "Карта дня – это уникальное ежедневное послание, помогающее иначе взглянуть на ситуацию и понять архетипы бессознательного, влияющие на вашу жизнь. "),
                vertical(10),
                lighttext(Colors.white, 13,
                    "Также карта содержит медитативное задание,направленное на познание своей личности, развитие самоконтроля и раскрытие внутреннего потенциала  "),
                vertical(20),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const OpenCard());
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
                      "Открыть послание",
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
}
