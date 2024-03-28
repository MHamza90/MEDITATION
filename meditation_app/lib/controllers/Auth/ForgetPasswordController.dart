import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../View/screens/auth_screens/ResetPassword.dart';
import '../../View/screens/auth_screens/SigninScreen.dart';
import '../../View/screens/auth_screens/VerificationCodeScreen.dart';
import '../../View/widgets/alertBoxes.dart';
import '../../components/ApiUrls.dart';
import '../../components/snackbar.dart';

class ForgetPassController extends GetxController {
  var backendmsg = ''.obs;

  dynamic Getforgetotp(
    String email,
  ) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.sendEmailURL), body: {
        "email": email,
      });

      if (response.statusCode == 200) {
        hideLoadingDialog();
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          Get.off(() => VerificationCodeScreen(
                email: email,
              ));
          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == false) {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      }
    } catch (e) {
      hideLoadingDialog();
      print('errorr  $e');
      showInSnackBar("Something went wrong",
          color: Colors.red, icon: CupertinoIcons.clear_circled);
    }
  }

  changevalue() {
    backendmsg.value = '';
  }

  dynamic verifyotp(String email, String code) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.verifyEmailURL), body: {
        'email': email,
        'code': code,
      });
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        hideLoadingDialog();
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          Get.to(() => ResetPassword(
                email: email,
              ));
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
      hideLoadingDialog();
      showInSnackBar("Something went wrong",
          color: Colors.red, icon: CupertinoIcons.clear_circled);
    }
  }

  dynamic sendPassword(String email, String pass) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.resetPasswordURL), body: {
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
          Get.offAll(() => SigninScreen());
          showInSnackBar(data["message"],
              color: Colors.green, icon: CupertinoIcons.checkmark_alt_circle);
        } else {
          hideLoadingDialog();
          showInSnackBar(data["message"],
              color: Colors.red, icon: CupertinoIcons.clear_circled);
        }
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        hideLoadingDialog();
        showInSnackBar(data["message"],
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
      hideLoadingDialog();
      showInSnackBar("Something went wrong",
          color: Colors.red, icon: CupertinoIcons.clear_circled);
    }
  }
}
