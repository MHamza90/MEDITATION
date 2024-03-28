import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/DiaryController.dart';
import '../../Helpers/spacer.dart';
import '../../Helpers/text.dart';
import '../../components/assets.dart';
import '../widgets/CustomAppBar.dart';

// ignore: must_be_immutable
class ExistingDiary extends StatefulWidget {
  String id;
  ExistingDiary({super.key, required this.id});

  @override
  State<ExistingDiary> createState() => _ExistingDiaryState();
}

class _ExistingDiaryState extends State<ExistingDiary> {
  final addDiaryController = Get.find<DiaryController>();
  TextEditingController commentController = TextEditingController();
  // final emotionlistController = Get.find<DiaryController>();
  List<String> selected = [];
  List<String> selectedID = [];
  var emojis = [
    AppImages.emoji1,
    AppImages.emoji2,
    AppImages.emoji3,
    AppImages.emoji4,
    AppImages.emoji5,
  ];
  double _value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addDiaryController.fetchEmotionList();
    _value = double.parse(addDiaryController.showNewDiary?.moodScale);
    selected = addDiaryController.showNewDiary?.emotions
            ?.map((e) => e.name.toString())
            .toList() ??
        [];
    commentController.text = addDiaryController.showNewDiary?.tellMore;
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
                    )
                  ],
                ),
                vertical(30),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Шкала настроения',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '(оцените от 1 до 5)',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 14,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                      ),
                    ),
                  ],
                ),
                vertical(20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('${emojis[_value.toInt()]}'),
                        height: 24,
                      ),
                      // Text(
                      //   '${emojis[_value.toInt()]}',
                      //   style: Theme.of(context).textTheme.displaySmall,
                      // ),

                      Slider(
                        value: _value,
                        //label: _emojis[_value.toInt()],
                        min: 0.0,
                        max: 4.0,
                        divisions: 4,
                        activeColor: const Color(0xffC870FE),
                        secondaryActiveColor: const Color(0xff3E206B),
                        inactiveColor: const Color(0xff3E206B),
                        thumbColor: Colors.white,
                        onChangeStart: (double value) {
                          print('Start value is ' + value.toString());
                        },
                        onChangeEnd: (double value) {
                          print('Finish value is ' + value.toString());
                        },
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("2", style: TextStyle(color: Colors.white)),
                          Text("3", style: TextStyle(color: Colors.white)),
                          Text("4", style: TextStyle(color: Colors.white)),
                          Text("5", style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
                // Slider(
                //   value: _currentSliderValue,
                //   max: 5,
                //   divisions: 5,
                //   activeColor: const Color(0xffC870FE),
                //   secondaryActiveColor: const Color(0xff3E206B),
                //   inactiveColor: const Color(0xff3E206B),
                //   thumbColor: Colors.white,
                //   label: _currentSliderValue.round().toString(),
                //   onChanged: (double value) {
                //     setState(() {
                //       _currentSliderValue = value;
                //     });
                //   },
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text('1', style: TextStyle(color: Colors.white),),
                //     Text('2'),
                //     Text('3'),
                //     Text('4'),
                //     Text('5'),
                //   ],
                // ),
                vertical(30),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Я чувствую..',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '(выберите до 3х эмоций)',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 14,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                      ),
                    ),
                  ],
                ),
                vertical(30),
                emotion(),
                // EmotionListWidget(),
                vertical(30),
                const Text(
                  'Расскажите подробнее',
                  style: TextStyle(
                    color: Color(0xFFF9F9F9),
                    fontSize: 16,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
                vertical(20),
                const Text(
                  'Попробуйте вспомнить и описать, что повлияло на ваше настроение и самочувствие',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 12,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                vertical(20),
                SizedBox(
                  width: Get.width,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: commentController,
                    // enabled: isEnabled,
                    maxLines: 6,
                    decoration: InputDecoration(
                        fillColor: const Color(0xFF2A203B),
                        filled: true,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Color(0xFF2A203B), width: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xFF808387), width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xFF808387), width: 1)),
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 15),
                        // hintText: hint,
                        hintStyle: const TextStyle(color: Color(0xFF544370)),
                        hintText: "Сегодня утром.."),
                  ),
                ),
                vertical(30),
                ElevatedButton(
                    onPressed: () {
                      print(_value);
                      addDiaryController.updateDiary(
                        widget.id,
                        _value.toString(),
                        "${addDiaryController.selected}",
                        commentController.text,
                      );
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
                      "Сохранить запись в дневник",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emotion() {
    return Wrap(
      children: addDiaryController.emotionList
          .map((i) => InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (selected.contains(i.name)) {
                    selected.remove(i.name);
                  } else {
                    selected.add(i.name.toString());
                  }
                  if (selectedID.contains(i.id.toString())) {
                    selectedID.remove(i.id.toString());
                  } else {
                    selectedID.add(i.id.toString());
                  }
                  setState(() {});

                  addDiaryController.addListValues(selectedID);
                  print(selectedID);
                  setState(() {});
                },
                child: Container(
                    width: Get.width * 0.29,
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                      color: selected.contains(i.name)
                          ? const Color(0xFF3E206B)
                          : const Color(0xFF22113C),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1,
                            color: selected.contains(i.name)
                                ? const Color(0xFF7F4CD2)
                                : const Color(0xFF3E206B)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: selected.contains(i.name)
                        ? mediumtext(Colors.white, 12, "${i.name}")
                        : mediumtext(Colors.white, 12, "${i.name}")),
              ))
          .toList(),
    );
  }
}
