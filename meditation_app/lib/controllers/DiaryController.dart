import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meditation_app/Models/EmotionListModel.dart';

import '../Models/ListDiaryModel.dart';
import '../Models/ShowNewDiaryModel.dart';
import '../View/screens/ExistingDiary.dart';
import '../View/screens/StatusDiary.dart';
import '../View/widgets/alertBoxes.dart';
import '../components/ApiUrls.dart';
import '../components/GlobalVariables.dart';
import '../components/snackbar.dart';

class DiaryController extends GetxController {
  List<ListDiaryData> diaryList = [];
  List<EmotionData> emotionList = [];
  NewDiaryData? showNewDiary;
  var isLoading = false.obs;
  var isEmotionLoading = false.obs;
  var isSliderLoading = false.obs;

  fetchDiaryList() async {
    isLoading.value = true;
    // RxDouble initialRating = 0.0.obs;

    try {
      final response = await http.get(
        Uri.parse(AppUrl.listDiaryURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        ListDiaryModel data1 =
            ListDiaryModel.fromJson(jsonDecode(response.body));
        diaryList = data1.data!;

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  List<String> selected = [];
  addListValues(List<String> value) {
    selected = value;
  }

  emptySelected() {
    selected = [];
  }

  fetchEmotionList() async {
    isEmotionLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.emotionListURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        EmotionListModel data12 =
            EmotionListModel.fromJson(jsonDecode(response.body));
        emotionList = data12.data!;

        isEmotionLoading.value = false;
      }
    } catch (e) {
      isEmotionLoading.value = false;
      print(e.toString());
    }
  }

  addDiary(String mood_scale, String emotion_ids, String tell_more) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.addDiaryURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'mood_scale': mood_scale,
        'emotion_ids': emotion_ids,
        'tell_more': tell_more,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          hideLoadingDialog();
          Get.to(() => StatusDiary());
          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  fetchNewDiary(String id) async {
    showLoadingDialog();
    try {
      final response = await http.get(
        Uri.parse('${AppUrl.showDiaryURL}/${id}'),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      // print(response.body);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        ShowNewDiaryModel data124 =
            ShowNewDiaryModel.fromJson(jsonDecode(response.body));
        showNewDiary = data124.data!;
        hideLoadingDialog();
        print(showNewDiary);
        Get.to(() => ExistingDiary(id: id));
      } else {
        hideLoadingDialog();
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }

  updateDiary(String id, String mood_scale, String emotion_ids,
      String tell_more) async {
    showLoadingDialog();
    try {
      var response =
          await http.post(Uri.parse(AppUrl.updateDiaryURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'mood_scale': mood_scale,
        'emotion_ids': emotion_ids,
        'tell_more': tell_more,
        'id': id,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          hideLoadingDialog();
          Get.to(() => StatusDiary());
          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  deleteDiary(
    String id,
  ) async {
    showLoadingDialog();
    try {
      var response = await http.delete(
        Uri.parse('${AppUrl.deleteDiaryURL}/$id'),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          fetchDiaryList();
          hideLoadingDialog();
          Get.back();

          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }
}
