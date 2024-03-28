import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meditation_app/View/screens/HomePage.dart';
import 'package:meditation_app/View/screens/ProfileScreen.dart';
import 'package:meditation_app/View/widgets/alertBoxes.dart';
import '../Models/AvatarModel.dart';
import '../Models/ProfileModel.dart';
import '../components/ApiUrls.dart';
import '../components/GlobalVariables.dart';
import '../components/snackbar.dart';

class ProfileController extends GetxController {
  var isAvatarLoading = false.obs;
  List<AvatarData> avatarList = [];
  ProfileData? userProfile;
  var avatarSelected;
  addAvatarValues(String value) {
    avatarSelected = value;
  }

  emptyAvatarSelected() {
    avatarSelected = "";
  }

  fetchAvatarList() async {
    showLoadingDialog();
    try {
      final response = await http.get(
        Uri.parse(AppUrl.avatarListURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        AvatarModel data38 = AvatarModel.fromJson(jsonDecode(response.body));
        avatarList = data38.data!;

        hideLoadingDialog();
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }

  fetchUserProfile() async {
    showLoadingDialog();
    try {
      final response = await http.get(
        Uri.parse(AppUrl.profileURL),
        headers: {
          'Authorization': "Bearer  ${appStorage.read("tokken")} ",
          'Accept': "application/json"
        },
      );

      if (response.statusCode == 200) {
        ProfileModel data90 = ProfileModel.fromJson(jsonDecode(response.body));
        userProfile = data90.data!;
        print("profile");
        print(userProfile?.name);
        print(userProfile.toString());

        hideLoadingDialog();
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }

  updateProfile(
    String name,
    String date_of_birth,
  ) async {
    showLoadingDialog();
    try {
      var response =
          await http.post(Uri.parse(AppUrl.updateProfileURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'name': name,
        'date_of_birth': date_of_birth,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          hideLoadingDialog();
          ProfileScreen();
          // fetchUserProfile();
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

  updateAvatar(String avatar) async {
    showLoadingDialog();
    try {
      var response =
          await http.post(Uri.parse(AppUrl.updateProfileURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'avatar': avatar,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          hideLoadingDialog();
          Get.back();
          fetchUserProfile();
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

  changePass(
      String oldPassword, String newPassword, String confirmPassword) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.changePassURL), headers: {
        'Authorization': "Bearer  ${appStorage.read("tokken")} ",
        'Accept': "application/json"
      }, body: {
        'old_password': oldPassword,
        'new_password': newPassword,
        'confirm_password': confirmPassword,
      });

      if (response.statusCode == 200) {
        print(response.body);

        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          hideLoadingDialog();
          Get.to(() => HomePage());
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
