import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/View/screens/HelpScreen.dart';
import 'package:meditation_app/View/screens/MeditationsAndPractices.dart';
import 'package:meditation_app/View/widgets/CustomAppBar.dart';

import '../../components/assets.dart';
import 'Cardoftheday.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: const Color(0xff0E0223),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                      color:
                          Color(0xFFC870FE), // Set the color for the top border
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Как использовать приложение?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff3E206B),
                          borderRadius: BorderRadius.circular(6)),
                      child: GestureDetector(
                        onTap: () {Get.to(()=>HelpScreen());},
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 170.0, // Set the width of the container
                    height: 240.0, // Set the height of the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          8), // Set the border radius for rounded corners
                      image: DecorationImage(
                        image: AssetImage(AppImages
                            .homeCard1), // Set the path to your image asset
                        fit: BoxFit
                            .cover, // Set the BoxFit to cover the entire container
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200.0, // Set the width of the container
                          height: 80.0,
                          margin:
                              const EdgeInsets.all(8.0), // Set margin if needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                8), // Set the border radius for rounded corners
                            border: Border.all(
                              color: const Color(
                                  0xffC870FE), // Set the border color
                              width: 3.0, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Дневник состояния",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Image(
                                    height: 100,
                                    width: 30,
                                    image: AssetImage(AppImages.diary))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 170.0, // Set the width of the container
                    height: 240.0, // Set the height of the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          8), // Set the border radius for rounded corners
                      image: DecorationImage(
                        image: AssetImage(AppImages
                            .homeCard2), // Set the path to your image asset
                        fit: BoxFit
                            .cover, // Set the BoxFit to cover the entire container
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200.0, // Set the width of the container
                          height: 80.0,
                          margin:
                              const EdgeInsets.all(8.0), // Set margin if needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                8), // Set the border radius for rounded corners
                            border: Border.all(
                              color: const Color(
                                  0xffC870FE), // Set the border color
                              width: 3.0, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Трекер привычек",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Image(
                                    height: 100,
                                    width: 30,
                                    image: AssetImage(AppImages.checkCircle))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Избранные медитации",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8), // Set the border radius for rounded corners
                  image: DecorationImage(
                    image: AssetImage(AppImages
                        .homeCard3), // Set the path to your image asset
                    fit: BoxFit
                        .cover, // Set the BoxFit to cover the entire container
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "10 мин",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Container(
                            height: 35,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xff22113C),
                              borderRadius: BorderRadius.circular(6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 210,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Намерение на день",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "Утренняя медитация «Намерение на день» положительно влияет на самочувствие и настроение",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(
                                        0xffC870FE), // Set the border color
                                    width: 2.0, // Set the border width
                                  ),
                                  color: const Color(0xff3E206B),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image(
                                    image: AssetImage(AppImages.playIcon)),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
                onPressed: () {Get.to(() => MeditationsAndPractices());},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff22113C),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Сохранить пароль",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8), // Set the border radius for rounded corners
                image: DecorationImage(
                  image: AssetImage(
                      AppImages.homeCard4), // Set the path to your image asset
                  fit: BoxFit
                      .fill, // Set the BoxFit to cover the entire container
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.all(20),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Карта дня",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Открой ежедневное метафорическое послание и узнай, что приготовила судьба",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => const Cardoftheday());
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
                                "Открыть карту",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Тренинги для развития личности",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8), // Set the border radius for rounded corners
                image: DecorationImage(
                  image: AssetImage(
                      AppImages.homeCard5), // Set the path to your image asset
                  fit: BoxFit
                      .cover, // Set the BoxFit to cover the entire container
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CardsList(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3E206B),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Все тренинги",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      )),
    ));
  }

  Widget CardsList() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection:
            Axis.horizontal, // Set the scroll direction to horizontal
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 170,
            padding: const EdgeInsets.all(4),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFF22113C),
              borderRadius: BorderRadius.circular(
                  8.0), // Set the border radius for all corners
              border: const Border(
                left: BorderSide(
                  color: Color(0xFFC870FE), // Set the color for the left border
                  width: 1.0,
                ),
                top: BorderSide(
                  color: Color(0xFFC870FE), // Set the color for the top border
                  width: 1.0,
                ),
              ),
            ), // Set the width of each item as needed
            margin: const EdgeInsets.symmetric(
                horizontal: 5.0), // Set horizontal margin between items
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Финансы",
                            style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        const Text(
                          "Тренинг, открывающий возможности денежного обмена и роста",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFF0F0F0),
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3E206B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Подробнее",
                              style:
                                  TextStyle(color:  Color(0xFFF0F0F0), fontSize: 9),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
