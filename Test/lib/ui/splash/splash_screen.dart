import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../router/app_router.dart';
import '../../values/export.dart';

@RoutePage()
class SplashHomePage extends StatefulWidget {
  const SplashHomePage({super.key});

  @override
  State<SplashHomePage> createState() => _SplashHomePageState();
}

class _SplashHomePageState extends State<SplashHomePage> {
  @override
  void initState() {
    redirectToLogin();
    super.initState();
  }

  Future<void> redirectToLogin() async {
    Future.delayed(const Duration(seconds: 2), () {
      final appDB = locator.get<AppDB>();     
      !appDB.isLogin
          ? context.router.replaceAll([LoginRoute()])
          : context.router.replaceAll([HomeRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.splashColors,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(Assets.imageLogo),
              ).wrapPaddingBottom(15),
              Text(
                S.of(context).erasustain,
                style: textSemiBold.copyWith(
                  fontSize: 24.sp,
                  color: AppColor.white,
                ),
              ).wrapPaddingBottom(30),
              Flexible(
                child: Wrap(children: [
                  Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    S.of(context).impactingLivesOneNotificationsAtATime,
                    style: textSemiBold.copyWith(
                      color: AppColor.white,
                      fontSize: 16.sp,
                    ),
                  ).wrapPaddingHorizontal(45),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 75.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                 Assets.imageMadeinInda,
                  height: 24.h,
                  width: 53.w,
                ),
                80.horizontalSpace,
                Image.asset(
                  Assets.imageStartup,
                  height: 24.h,
                  width: 96.w,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).madeInIndia,
                  style: textSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.white,
                  ),
                ),
                10.horizontalSpace,
                Text(
                  " | ",
                  style: textSemiBold.copyWith(
                      fontSize: 16.sp, color: AppColor.white),
                ),
                10.horizontalSpace,
                Text(
                  S.of(context).nayadeshnayisoch,
                  style: textSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.white,
                  ),
                )
              ],
            ).wrapPaddingTop(15),
          ),
        ],
      ),
    );
  }
}
