import 'package:flutter/material.dart';
import 'package:task_29_5/values/app_color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.5),
                offset: const Offset(0, 5),
                blurRadius: 10,
              ),
            ]),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: AppColor.transparent,
          child: Ink(
            child: InkWell(
              onTap: () {
                onPressed();
              },
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
