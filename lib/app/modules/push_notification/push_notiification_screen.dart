import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/push_notification/push_notiification_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';

class PushNotificationScreen
    extends BaseView<PushNotificationScreenController> {
  PushNotificationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageAppBar(title: "Push Notification"),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New matches",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.newMatches,
                              onChanged: (value) {
                                controller.newMatches = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Massages",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.messages,
                              onChanged: (value) {
                                controller.messages = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Message Likes",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.messageLike,
                              onChanged: (value) {
                                controller.messageLike = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Super Likes",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.superLike,
                              onChanged: (value) {
                                controller.superLike = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Picks",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.topPicks,
                              onChanged: (value) {
                                controller.topPicks = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Likes",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: controller.newLikes,
                              onChanged: (value) {
                                controller.newLikes = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
