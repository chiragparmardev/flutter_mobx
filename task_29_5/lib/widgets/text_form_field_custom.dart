import 'package:flutter/material.dart';
import 'package:task_29_5/values/app_color.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const TextFormFieldCustom({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(
          fontSize: 15,
          color: AppColor.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: AppColor.lightBlue,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: AppColor.greyLight,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColor.primary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColor.primary,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColor.lightBlue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
