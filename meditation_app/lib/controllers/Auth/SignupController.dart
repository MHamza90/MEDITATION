import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View/screens/auth_screens/SigninScreen.dart';
import '../../View/widgets/alertBoxes.dart';
import '../../components/ApiUrls.dart';
import 'package:http/http.dart' as http;
import '../../components/snackbar.dart';

class SignUpController extends GetxController {
  var backendmsg = ''.obs;

  dynamic SendSignUp(
    Map<String, dynamic> signup,
  ) async {
    showLoadingDialog();
    print("inside register");
    try {
      var response = await http.post(Uri.parse(AppUrl.signupURL), body: signup);

      print(response.body);
      if (response.statusCode == 200) {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          Get.to(() => SigninScreen());
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

  changevalue() {
    backendmsg.value = '';
  }
}
