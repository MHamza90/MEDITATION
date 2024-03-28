import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Controllers/DiaryController.dart';
import '../../Helpers/text.dart';

class EmotionListWidget extends StatefulWidget {
  const EmotionListWidget({super.key});

  @override
  State<EmotionListWidget> createState() => _EmotionListWidgetState();
}

class _EmotionListWidgetState extends State<EmotionListWidget> {
  final emotionlistController = Get.find<DiaryController>();
  List<String> selected = [];
  List<String> selectedID = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emotionlistController.fetchEmotionList();

    // selected = emotionlistController.showNewDiary != null
    //     ? emotionlistController.showNewDiary!.emotionIds != null
    //         ? emotionlistController.showNewDiary!.emotionIds!
    //             .map((e) => e.intrest != null
    //                 ? e.intrest!.name != null
    //                     ? e.intrest!.name.toString()
    //                     : 'user'
    //                 : 'user')
    //             .toList()
    //         : []
    //     : [];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: emotionlistController.emotionList
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

                  emotionlistController.addListValues(selectedID);
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
