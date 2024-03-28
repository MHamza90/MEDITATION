import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
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
                        const Spacer(),
                        const Text(
                          'Карта дня',
                          style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 14,
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
                      height: Get.height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages
                              .image4), // Set the path to your image asset
                          fit: BoxFit
                              .cover, // Set the BoxFit to cover the entire container
                        ),
                      ),
                    ),
                    vertical(20),
                    Row(
                      children: [
                        mediumtext(Colors.white, 16, "Ваша карта – "),
                        mediumtext(Color(0xff7A59FF), 16, "Спящий")
                      ],
                    ),
                    vertical(20),
                    lighttext(Colors.white, 13,
                        "На карте изображена спящая красавица, но её красота – мираж. Пока она спит, ее внутренний голос неясен и не слышен. Это мешает ей принимать правильные решения и избегать ошибок. Чтобы раскрыть женственность и Аниму, необходимо пробудиться,и только тогда вся сила красоты сможет стать проявленной и быть использована для достижения целей и желаний."),
                    vertical(10),
                    lighttext(Colors.white, 13,
                        "Чтобы проснуться, обратите внимание на молодость изображенной женщины, а это значит, что никогда не поздно сделать шаг. Ускорить процесс помогут атрибуты:  роскошное ложе, слуги и придворные, наблюдающие за ее сном. Красавица одета в роскошное платье, ее волосы украшены драгоценными камнями.У вас уже есть часть ресурсов, но они не используются,а остаются незаметными, пока вы выбираете цветные, но иллюзорные картинки сновидений."),
                    vertical(20),
                    Row(
                      children: [
                        mediumtext(Colors.white, 16, "Практика "),
                        mediumtext(Color(0xff7A59FF), 16, "«Осознанный день»")
                      ],
                    ),
                    vertical(20),
                    lighttext(Colors.white, 12, "Вам понадобятся: "),
                    vertical(20),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage(AppImages.icon2),
                          color: Color(0xff7A59FF),
                        ),
                        mediumtext(Colors.white, 16, "  Телефон и ежедневник")
                      ],
                    ),
                    vertical(20),
                    lighttext(Colors.white, 12,
                        "В один из дней поставьте будильник на каждый часв течение дня. В моменте, когда прозвучал сигнал,вам нужно сделать 2 вещи: "),
                    vertical(20),
                    lighttext(Colors.white, 12,
                        "1. Спросить себя, что вы сейчас ощущаете, что вы\n чувствуете?"),
                    vertical(20),
                    lighttext(Colors.white, 12,
                        "2. За что вы себе благодарны, за что готовы себя \n похвалить."),
                    vertical(20),
                    lighttext(Colors.white, 12, "Запишите ответы в заметки или блокнот. Если вы испытываете трудность, значит похвалите себя за то, что вы стараетесь, за свое намерение, за попытку. Благодарить можно за самые простые и очевидные вещи, которые мы воспринимаем как должное.За то, что вы дышите. За то, что ваш организм работает без перерывов и выходных."),
                    vertical(20),
                    lighttext(Colors.white, 12, "В конце дня проанализируйте свои записи. Посмотрите, каких чувств больше. Как вы их проживаете?Из-за чего они возникли? Даете ли вы им место или вам даже перед самим собой стыдно за такие мысли?"),
                    // vertical(20),
                    // lighttext(Colors.white, 12, "Вам понадобятся: "),
                    // vertical(20),
                    // lighttext(Colors.white, 12, "Вам понадобятся: "),
                  ],
                ),
              ),
            )));
  }
}
