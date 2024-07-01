import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final Color bgColor;
  final String title;
  final Color titleColor;
  final String iconImage;
  final Function? ontap;
  final double? RadiusImage;

  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.titleColor,
      required this.iconImage,
      this.ontap,
      this.RadiusImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: bgColor),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: AppColor.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap != null ? ontap!() : null;
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: textBold.copyWith(
                      fontSize: 12.spMin,
                      color: titleColor,
                      fontFamily: 'fraunces',
                    ),
                  ),
                  iconImage.isNotEmpty ? 10.horizontalSpace : SizedBox(),
                  iconImage.isNotEmpty
                      ? AppImage(
                          assets: iconImage,
                          width: RadiusImage ?? 11.r,
                          height: RadiusImage ?? 11.r,
                        )
                      : SizedBox()
                ],
              ),
            ).wrapPaddingSymmetric(horizontal: 30, vertical: 11),
          ),
        ),
      ),
    );
  }
}
