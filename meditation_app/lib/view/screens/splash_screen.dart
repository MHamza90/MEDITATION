import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/Helpers/text.dart';
import 'package:meditation_app/components/assets.dart';
import 'package:meditation_app/View/screens/auth_screens/SigninScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  moveto() async {
    Future.delayed(
        const Duration(seconds: 4),
        () => {
              Get.to(() => SigninScreen())
              // Get.to(HomePage())
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image(
            image: AssetImage(AppImages.mainlogo),
            height: 175,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          // const Text(
          //   "Level Up",
          //   style: TextStyle(
          //       fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
          // ),

          lighttext(Color(0xFFDFDFDF), 14,
              "Инструментарий личностного роста\nи духовного развития",
              center: true)
        ],
      ),
    );
  }
}
