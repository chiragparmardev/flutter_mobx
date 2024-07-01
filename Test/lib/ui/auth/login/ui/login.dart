import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/data/model/request/otp_reqest_model.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/show_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../../values/export.dart';
import '../../../../widget/country_textform.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> otpSend() async {
    var reqenc = OtpReqModel(
        appVersion: "13",
        countryCode: "91",
        deviceToken: "0",
        deviceName: "Iphone 13",
        deviceType: "A",
        email: "testuser123@gmail.com",
        modelName: "Iphone 13",
        osVersion: "13",
        phone: "${authStore.mobileNumer}");

    await authStore.otpSend(reqenc).then((value) {
      print(authStore.otpRes!.code.toString());
      if (authStore.otpRes!.code == 10) {
        showMessage(authStore.otpRes!.data!.otp.toString(), true);
        appDB.isLogin = true;
        appDB.token = authStore.otpRes!.data!.userDetail!.token.toString();
        showMessage('Login Successfully', true);
        context.router.replaceAll([HomeRoute()]);
      } else {
        showMessage(authStore.otpRes!.data!.otp, true);
        showMessage('Login Failed', false);
      }
    });
    //   .catchError( (error) {
    //     authStore.isloading = false;
    //     showMessage('Login Failed',false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.imageUnion,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 421.r,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 104.r, left: 41.r, right: 41.r),
                    child: Text(
                      maxLines: 2,
                      S.of(context).becomeVolunteerStartDonations,
                      textAlign: TextAlign.center,
                      style: textSemiBold.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 190.r),
                    child: Center(
                      child: Image.asset(
                        Assets.imageLogin,
                        height: 260.h,
                        width: 280.w,
                      ),
                    ),
                  ).wrapPaddingSymmetric(horizontal: 48),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    17.verticalSpace,
                    CountryTextFormField(mobileController: mobileController),
                    Text(
                      S
                          .of(context)
                          .byContinuingYouAreAgreeingToOurTermsConditionsPrivacy,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black.withOpacity(0.3),
                        fontFamily: 'fraunces_lights',
                      ),
                    ).wrapPaddingTop(48).wrapPaddingBottom(15),
                    SizedBox(
                      width: double.maxFinite,
                      height: 50.h,
                      child: Observer(builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            backgroundColor: authStore.buttonColor,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (authStore.mobileNumer!.length == 10) {
                                otpSend();
                              } else {
                                if (mobileController.text.isEmpty) {
                                  showMessage(
                                      'Please Enter Mobile Number', false);
                                } else {
                                  showMessage(
                                      'Please Enter Valid Mobile Number',
                                      false);
                                }
                              }
                            }
                          },
                          child: authStore.isloading
                              ? CircularProgressIndicator(
                                  color: AppColor.white,
                                )
                              : Text(
                                  S.of(context).sendOtp,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        );
                      }),
                    )
                  ],
                ),
              ).wrapPaddingHorizontal(30),
            ],
          ).wrapPaddingBottom(15)),
    );
  }
}
