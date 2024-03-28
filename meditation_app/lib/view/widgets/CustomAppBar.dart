import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFFC870FE),
            height: 1.0,
          ),
        ),
        backgroundColor: Color(0xff0E0223),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: CircleAvatar(
                          radius: 18.0,
                          backgroundImage: AssetImage(AppImages.avatar1),
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    const Text(
                      "Анна",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
