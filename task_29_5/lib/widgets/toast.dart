// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_29_5/values/app_color.dart';

class Utility {
  static void showErrorMessage(String message,
      {bool enableShortToast = false , bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: enableShortToast ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? AppColor.red  : AppColor.primary,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
