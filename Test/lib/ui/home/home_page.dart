import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/data/model/request/social_profile_request_model.dart';
import 'package:flutter_demo_structure/data/widgets/drop_down_data.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_demo_structure/widget/more_custom.dart';
import 'package:flutter_demo_structure/widget/show_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo_structure/widget/custom_button.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logOut() async {
    authStore.isloading = true;

    await authStore.logout().then((value) {
      authStore.isloading = false;
      if (authStore.logoutResponse!.code.toString() == "1") {
        showMessage(S.of(context).logoutSucessfully, true);
        appDB.logout();
        context.router.replaceAll([LoginRoute()]);
      } else {
        showMessage(S.of(context).logoutFailed, false);
      }
    });
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  void getProfile() {
    var reqenc = SocialProfileReqModel(socialProfileId: "214");
    authStore.getProfile(reqenc).then((value) {
      if (authStore.socialProfileRes!.code.toString() == "1") {
      } else {
        showMessage(authStore.errorMessage.toString(), false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (authStore.isloading) {
          return Scaffold(
            body: const Center(
              child: CircularProgressIndicator(
                color: AppColor.darkGreen,
              ),
            ),
          );
        } else if (authStore.errorMessage != null) {
          return Scaffold(
            body:  authStore.errorMessage.toString()  == "No Active Internet Connection" ? 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(
                height: 300.h,
                width: 300.h,
                assets: 'assets/image/internet.png',
              ),
              CustomButton(bgColor: AppColor.darkGreen, title: 'Try Again', titleColor: AppColor.white, iconImage: '',ontap: (){
                getProfile();
              },)
            ],
          ).wrapPaddingSymmetric(horizontal: 30,vertical: 30): Text(authStore.errorMessage.toString())
        
          );
        } else if (authStore.socialProfileRes?.data != null) {
          var socialData = authStore.socialProfileRes!.data!;
          return buildBody(context, socialData);
        } else {
          return Center(
            child: Text(S.of(context).noDataFound3),
          );
        }
      },
    );
  }

  Scaffold buildBody(BuildContext context, socialData) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.white,
        leadingWidth: 0,
        title: Text(
          S.of(context).socialPartner,
          style: textSemiBold.copyWith(
              fontSize: 24.spMin, color: AppColor.darkGreen),
        ).wrapPaddingLeft(15),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Material(
              color: AppColor.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    logOutAlert(context);
                  },
                  child: AppImage(
                    boarderWidth: 0,
                    assets: Assets.imagePowerOff,
                    radius: 16,
                  ),
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: AppImage(
              boarderWidth: 0,
              url: socialData.profileImage,
              radius: 16.r,
            ),
          ),
          30.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            url: authStore.socialProfileRes!.data!.coverImage,
            radius: 10.r,
            width: double.infinity,
            height: 192.h,
          ).wrapPaddingSymmetric(horizontal: 30),
          ngoTile(context).wrapPaddingTop(30).wrapPaddingHorizontal(30),
          Text(
            S.of(context).aboutUs,
            style: textBold.copyWith(fontSize: 14.sp),
          ).wrapPaddingHorizontal(30).wrapPaddingTop(30).wrapPaddingBottom(5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " • ",
                style: textRegular.copyWith(
                    fontSize: 12.sp, color: AppColor.black.withOpacity(0.7)),
              ),
              5.horizontalSpace,
              Flexible(
                  child: Text(
                maxLines: 2,
                S.of(context).weAreAMultinationalNpoWorkingTowardsTheWelfareOf,
                style: textRegular.copyWith(
                    fontSize: 12.sp, color: AppColor.black.withOpacity(0.7)),
              ))
            ],
          ).wrapPaddingHorizontal(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                  bgColor: AppColor.darkGreen,
                  title: S.of(context).committed,
                  titleColor: AppColor.white,
                  iconImage: Assets.imageVerify),
              15.horizontalSpace,
              CustomButton(
                bgColor: AppColor.darkGreen.withOpacity(0.15),
                title: S.of(context).followed,
                titleColor: AppColor.darkGreen,
                iconImage: Assets.imageProfileVerify,
                RadiusImage: 16.r,
              )
            ],
          ).wrapPaddingSymmetric(horizontal: 30).wrapPaddingTop(30),
          10.horizontalSpace,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.tetxFieldBg,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Text(
                      authStore.socialProfileRes!.data!.totalCommitted
                          .toString(),
                      style: textSemiBold.copyWith(
                        fontSize: 14.spMin,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      S.of(context).committed,
                      style: textRegular.copyWith(
                        fontSize: 12.spMin,
                      ),
                    )
                  ],
                ).wrapPaddingSymmetric(horizontal: 20, vertical: 6),
              ),
              Spacer(),
              10.horizontalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColor.tetxFieldBg,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Text(
                      authStore.socialProfileRes!.data!.totalFollowers
                          .toString(),
                      style: textSemiBold.copyWith(
                        fontSize: 14.spMin,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      S.of(context).followers,
                      style: textRegular.copyWith(
                        fontSize: 12.spMin,
                      ),
                    )
                  ],
                ).wrapPaddingSymmetric(horizontal: 12, vertical: 6),
              ),
              Spacer(),
              10.horizontalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColor.darkGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: AppColor.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        showBottomSheetCustom(context);
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.imagePhone,
                                height: 12.75.h,
                                width: 12.75.w,
                                fit: BoxFit.contain,
                              ),
                              5.horizontalSpace,
                              Image.asset(
                                Assets.imageEmailOutline,
                                height: 12.75.h,
                                width: 12.75.w,
                                fit: BoxFit.contain,
                              ),
                              5.horizontalSpace,
                              Image.asset(
                                Assets.imageWhatsapp,
                                height: 12.75.h,
                                width: 12.75.w,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          3.verticalSpace,
                          Text(
                            S.of(context).contact,
                            style: textRegular.copyWith(
                                fontSize: 12.spMin, color: AppColor.darkGreen),
                          )
                        ],
                      ).wrapPaddingSymmetric(horizontal: 20, vertical: 6),
                    ),
                  ),
                ),
              )
            ],
          ).wrapPaddingHorizontal(30).wrapPaddingTop(30),
          CustomButton(
                  bgColor: AppColor.darkGreen.withOpacity(0.15),
                  title: S.of(context).getCertificate,
                  titleColor: AppColor.darkGreen,
                  iconImage: Assets.imageVerifyPrimary)
              .wrapPaddingTop(30)
              .wrapPaddingHorizontal(30),
          CustomButton(
                  bgColor: AppColor.darkGreen.withOpacity(0.15),
                  title: S.of(context).volunteer,
                  titleColor: AppColor.darkGreen,
                  iconImage: Assets.imageProfileSend,
                  RadiusImage: 16)
              .wrapPaddingTop(30)
              .wrapPaddingHorizontal(30),
          ambassadors(context, socialData)
              .wrapPaddingHorizontal(30)
              .wrapPaddingTop(30)
              .wrapPaddingBottom(15),
          topVolunteer(context, socialData)
              .wrapPaddingHorizontal(30)
              .wrapPaddingVertical(30),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.updateBg,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                MoreCustom(
                  title: S.of(context).update,
                  imgUrl: socialData
                      .normalCampaignData.campaignMediaList[0].postImage,
                  listTitle: socialData.normalCampaignData.campaignName,
                  listSubTitle1:
                      '${DateFormat('MMM dd, yy').format(socialData.normalCampaignData.startDate)}, ${socialData.normalCampaignData.country}',
                  listSubTitle2:
                      '${socialData.normalCampaignData.intrested}  interested',
                  endDate:
                      'End Date: ${DateFormat('dd MMM yy').format(socialData.normalCampaignData.endDate)},',
                  participatedNumber:
                      socialData.normalCampaignData.participated.toString(),
                  viewButtonTitle: S.of(context).campaign,
                  description: socialData.normalCampaignData.discription,
                ),
                MoreCustom(
                    title: S.of(context).sos,
                    imgUrl: socialData
                        .sosCampaignData.campaignMediaList[0].postImage,
                    listTitle: socialData.sosCampaignData.campaignName,
                    listSubTitle1:
                        '${DateFormat('MMM dd, yy').format(socialData.sosCampaignData.startDate)}, ${socialData.sosCampaignData.country}',
                    listSubTitle2:
                        '${socialData.sosCampaignData.intrested} interested',
                    endDate: '3 days left',
                    participatedNumber:
                        socialData.sosCampaignData.participated.toString(),
                    viewButtonTitle: S.of(context).sos,
                    description: socialData.sosCampaignData.discription)
              ],
            ),
          ),
        ],
      ).wrapPaddingTop(20)),
    );
  }

  Row ngoTile(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(Assets.imageWho), fit: BoxFit.cover)),
        ),
        15.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      authStore.socialProfileRes!.data!.name,
                      style: textSemiBold.copyWith(fontSize: 16.spMin),
                    ),
                  ),
                  Image.asset(
                    Assets.imageBlueTick,
                    height: 15.r,
                    width: 15.r,
                    fit: BoxFit.contain,
                  )
                ],
              ),
              8.verticalSpace,
              Container(
                  decoration: BoxDecoration(
                      color: AppColor.tetxFieldBg,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: S.of(context).Mutuals12,
                        style: textBold.copyWith(
                            color: AppColor.black.withOpacity(0.4),
                            fontSize: 12.sp,
                            fontFamily: 'fraunces')),
                    TextSpan(
                        text: S.of(context).includingKaran,
                        style: textRegular.copyWith(
                            color: AppColor.black.withOpacity(0.4),
                            fontSize: 12.sp,
                            fontFamily: 'fraunces')),
                  ])).wrapPaddingSymmetric(horizontal: 7, vertical: 5)),
            ],
          ),
        ),
      ],
    );
  }

  Container topVolunteer(BuildContext context, socialData) {
    return Container(
      height: 47.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.tetxFieldBg,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).topVolunteer,
            style: textRegular.copyWith(
              fontSize: 12.spMin,
              color: AppColor.black.withOpacity(0.5),
            ),
          ),
          Text(
            socialData.topVolunteer ?? '---',
            style: textSemiBold.copyWith(
              fontSize: 14.spMin,
            ),
          )
        ],
      ).wrapPaddingHorizontal(15),
    );
  }

  Container ambassadors(BuildContext context, socialData) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.tetxFieldBg, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).celebrityAmbassadors,
            style: textRegular.copyWith(
              fontSize: 12.sp,
              color: AppColor.black.withOpacity(0.5),
            ),
          ).wrapPaddingTop(10).wrapPaddingBottom(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  socialData.celebrity.length,
                  (index) => CelebrityProfile(
                          socialData.celebrity[index].profileImage,
                          socialData.celebrity[index].name)
                      .wrapPaddingRight(30),
                )).wrapPaddingBottom(10),
          )
        ],
      ).wrapPaddingLeft(15),
    );
  }

  Future<dynamic> logOutAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            Icons.info_outline_rounded,
            size: 30,
          ),
          content: Text(
            maxLines: 2,
            S.of(context).areYouSureYouWantToLogout,
            style: textRegular.copyWith(fontSize: 16.spMin),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  bgColor: AppColor.darkGreen,
                  title: S.of(context).cancel,
                  titleColor: AppColor.white,
                  iconImage: '',
                  ontap: () {
                    context.router.pop();
                  },
                ),
                CustomButton(
                  bgColor: AppColor.darkGreen,
                  title: S.of(context).logout,
                  titleColor: AppColor.white,
                  iconImage: '',
                  ontap: () async {
                    context.router.pop();
                    logOut();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showBottomSheetCustom(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      backgroundColor: AppColor.white,
      showDragHandle: true,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return Wrap(
                children: List.generate(
                    dropDownDataList.length,
                    (index) => ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            dropDownDataList[index].title,
                            style: textSemiBold.copyWith(
                                fontSize: 14.spMin, color: AppColor.black),
                          ),
                          subtitle: Text(dropDownDataList[index].subtitle,
                              style: textRegular.copyWith(
                                  fontSize: 12.spMin,
                                  color: AppColor.black.withOpacity(0.5))),
                          leading: Container(
                            height: 50.r,
                            width: 50.r,
                            decoration: BoxDecoration(
                                color: AppColor.tetxFieldBg,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                              child: Image.asset(
                                dropDownDataList[index].imgUrl,
                                width: 18.r,
                                height: 18.r,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ).wrapPaddingBottom(15)))
            .wrapPaddingBottom(15)
            .wrapPaddingHorizontal(30);
      },
    );
  }

  Container CelebrityProfile(String profileImage, String Name) {
    return Container(
      width: 56.w,
      child: Column(
        children: [
          AppImage(
            url: profileImage,
            radius: 28.r,
          ),
          15.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            Name,
            style: textRegular.copyWith(
              fontSize: 12.spMin,
              color: AppColor.black.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
