import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../View/screens/HomePage.dart';
import '../../View/widgets/alertBoxes.dart';
import '../../components/ApiUrls.dart';
import '../../components/GlobalVariables.dart';
import '../../components/snackbar.dart';

class SignInController extends GetxController {
  var backendmsg = ''.obs;
  final GetStorage appStorage = GetStorage();

  dynamic SendLogin(String email, String pass) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.loginURL), body: {
        'email': email,
        'password': pass,
      });

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        hideLoadingDialog();
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          appStorage.write('tokken', data['data']["token"]);
          appStorage.write(USERID, data["data"]["user"]["id"]);
          appStorage.write(userName, data["data"]["user"]["name"]);
          appStorage.write(profileUrl, data["data"]["user"]["avatar"]);
          data['data']["token"];
          print("${appStorage.read(USERID)} My ID");
          Get.to(() => HomePage());
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        print(response.body);
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
      hideLoadingDialog();
    }
  }

  changevalue() {
    backendmsg.value = '';
  }
}
