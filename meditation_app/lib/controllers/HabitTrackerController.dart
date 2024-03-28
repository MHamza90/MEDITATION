import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/ExecutionListModel.dart';
import '../Models/HabitTrackerModel.dart';
import '../Models/HabitsListModel.dart';
import '../View/widgets/alertBoxes.dart';
import '../components/ApiUrls.dart';
import '../components/GlobalVariables.dart';
import '../components/snackbar.dart';

class HabitController extends GetxController {
  List<ExecutionData> executionList = [];
  List<HabitsData> habitList = [];
  TrackerData? showTracker;
  var isExecutionLoading = false.obs;
  var isHabitLoading = false.obs;

  fetchExecutionList() async {
    isExecutionLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(AppUrl.executionListURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        ExecutionListModel data31 =
            ExecutionListModel.fromJson(jsonDecode(response.body));
        executionList = data31.data!;

        isExecutionLoading.value = false;
      }
    } catch (e) {
      isExecutionLoading.value = false;
      print(e.toString());
    }
  }

  String selectedExecution = ''; // Track the selected item

  void addExecutionValue(String value) {
    selectedExecution = value;
  }

  // emptySelected() {
  //   selected = [];
  // }

  fetchHabitList() async {
    isHabitLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.habitsListURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        HabitsListModel data32 =
            HabitsListModel.fromJson(jsonDecode(response.body));
        habitList = data32.data!;

        isHabitLoading.value = false;
      }
    } catch (e) {
      isHabitLoading.value = false;
      print(e.toString());
    }
  }

  addTracker(String name, String executionId, String habitId) async {
    showLoadingDialog();
    try {
      var response =
          await http.post(Uri.parse(AppUrl.createTrackerURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'name': name,
        'execution_id': executionId,
        'habit_id': habitId,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          fetchTracker();
          hideLoadingDialog();
          Get.back();
          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          Get.back();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Get.back();
        Map<String, dynamic> data = jsonDecode(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  fetchTracker() async {
    showLoadingDialog();
    try {
      final response = await http.get(
        Uri.parse(AppUrl.trackerURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        HabitTrackerModel data14 =
            HabitTrackerModel.fromJson(jsonDecode(response.body));
        showTracker = data14.data!;
        hideLoadingDialog();
      } else {
        hideLoadingDialog();
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }

  deleteTracker(
    String id,
  ) async {
    showLoadingDialog();
    try {
      var response = await http.delete(
        Uri.parse('${AppUrl.deleteTrackerURL}/$id'),
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
          hideLoadingDialog();
          Get.back();

          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          Get.back();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Get.back();
        Map<String, dynamic> data = jsonDecode(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }
}
