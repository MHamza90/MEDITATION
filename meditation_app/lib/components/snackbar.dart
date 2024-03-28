import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Helpers/spacer.dart';

GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showInSnackBar(String value,
    {Color? color, int? duration, IconData? icon}) {
  FocusManager.instance.primaryFocus?.unfocus();
  final SnackBar snackBar = SnackBar(
    margin: EdgeInsets.only(bottom: Get.height * 0.75, left: 30, right: 30),
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        horizental(10),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'caviarbold'),
          ),
        ),
      ],
    ),
    dismissDirection: DismissDirection.up,
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: duration ?? 1500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  snackbarKey.currentState?.showSnackBar(snackBar);
}
