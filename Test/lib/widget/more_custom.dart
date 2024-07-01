import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo_structure/widget/custom_button.dart';

class MoreCustom extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String listTitle;
  final String listSubTitle1;
  final String listSubTitle2;
  final String endDate;
  final String participatedNumber;
  final String viewButtonTitle;
  final String description;
  const MoreCustom({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.listTitle,
    required this.listSubTitle1,
    required this.listSubTitle2,
    required this.endDate,
    required this.participatedNumber,
    required this.viewButtonTitle, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: textSemiBold.copyWith(
              fontSize: 12.sp, color: AppColor.updateText),
        ).wrapPaddingVertical(15),
        Container(
          decoration: BoxDecoration(
              color: AppColor.tetxFieldBg,
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               AppImage(
                url: imgUrl,
                radius: 10.r,
                  height: 174.h,
                  width: double.infinity,
              ),
              ListTile(
                
                contentPadding: EdgeInsets.all(0),
                title:  Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          listTitle,
                          style: textSemiBold.copyWith(
                              fontSize: 14.spMin, color: AppColor.black),
                        ).wrapPaddingBottom(5),
                        subtitle: Row(
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 2,
                        listSubTitle1,
                        style: textRegular.copyWith(
                            fontSize: 12.spMin,
                            color: AppColor.black.withOpacity(0.5)),
                      ),
                    ),
                    Text(
                      '|',
                      style: textRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColor.black.withOpacity(0.5)),
                    ).wrapPaddingHorizontal(10),
                    Flexible(
                      child: Text(
                        maxLines: 2,
                        listSubTitle2,
                        style: textRegular.copyWith(
                            fontSize: 12.spMin,
                            color: AppColor.black.withOpacity(0.5)),
                      ),
                    )
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Share',
                      style: textSemiBold.copyWith(
                          fontSize: 12.sp, color: AppColor.darkGreen),
                    ),
                    6.horizontalSpace,
                    AppImage(assets: Assets.imageShare,height: 11.r,width: 11.r,),
                  ],
                ).wrapPaddingSymmetric(horizontal: 7, vertical: 10),
              ).wrapPaddingVertical(15),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.updateText.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Text(
                      endDate,
                      style: textSemiBold.copyWith(
                        color: AppColor.updateText,
                        fontSize: 12.spMin,
                      ),
                    ).wrapPaddingSymmetric(horizontal: 7, vertical: 5),
                  ),
                  5.horizontalSpace,
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.updateText.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Text(
                      '${participatedNumber} participated',
                      style: textSemiBold.copyWith(
                        color: AppColor.updateText,
                        fontSize: 12.spMin,
                      ),
                    ).wrapPaddingSymmetric(horizontal: 7, vertical: 5),
                  ),
                ],
              ),
              Text(
                maxLines: 3,
                description,
                style: textRegular.copyWith(
                    color: AppColor.black.withOpacity(0.7), fontSize: 12.sp),
              ).wrapPaddingVertical(15),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                            vertical: 11.5, horizontal: 25),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.darkGreen),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r)))),
                  onPressed: () {},
                  child: Text(
                    'Donate',
                    style: textBold.copyWith(
                      color: AppColor.white,
                      fontSize: 12.spMin,
                    ),
                  )),
              Column(
                children: [
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: '\$105,171 raised ',
                              style: textBold.copyWith(
                                  color: AppColor.darkGreen,
                                  fontSize: 12.spMin,
                                  fontFamily: 'fraunces'),
                              children: [
                            TextSpan(
                                text: '(\$140,228 goal)',
                                style: textRegular.copyWith(
                                    color: AppColor.black.withOpacity(0.5),
                                    fontSize: 12.spMin,
                                    fontFamily: 'fraunces'))
                          ])),
                      Spacer(),
                      Text('75%',
                          style: textRegular.copyWith(
                              color: AppColor.black.withOpacity(0.5),
                              fontSize: 12.spMin,
                              fontFamily: 'fraunces'))
                    ],
                  ),
                  10.verticalSpace,
                  LinearProgressIndicator(
                    backgroundColor: AppColor.darkGreen.withOpacity(0.1),
                    value: 0.75,
                    minHeight: 9.h,
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.darkGreen,
                  )
                ],
              )
                  .wrapPaddingSymmetric(horizontal: 15, vertical: 15)
                  .wrapPaddingTop(10)
            ],
          ).wrapPaddingAll(15),
        ),
        CustomButton(
                bgColor: AppColor.darkGreen.withOpacity(0.15),
                title: 'View All ${viewButtonTitle}',
                titleColor: AppColor.darkGreen,
                iconImage: Assets.imageForward)
            .wrapPaddingVertical(15)
      ],
    ).wrapPaddingHorizontal(30);
  }
}
