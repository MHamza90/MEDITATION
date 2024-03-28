import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/components/assets.dart';
import 'package:meditation_app/View/screens/CardDetail.dart';

class OpenCard extends StatefulWidget {
  const OpenCard({super.key});

  @override
  State<OpenCard> createState() => _OpenCardState();
}

class _OpenCardState extends State<OpenCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff0E0223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
                  onTap: () {
                    Get.to(() => CardDetail());
                  },
                  child: Image(image: AssetImage(AppImages.CardAnimation))))
        ],
      ),
    ));
  }
}
