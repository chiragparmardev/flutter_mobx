import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(
  String msg,
  bool? isNoterror,
) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: isNoterror != true ? AppColor.red : AppColor.darkGreen,
      toastLength: Toast.LENGTH_SHORT,
      gravity:isNoterror == true ? ToastGravity.BOTTOM: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0.sp);
}
