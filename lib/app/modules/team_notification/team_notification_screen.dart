import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/team_notification/team_notification_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';

class TeamNotificationScreen
    extends BaseView<TeamNotificationScreenController> {
  TeamNotificationScreen({super.key});

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
              const CustomPageAppBar(title: "Team Notification"),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Team Notification",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "Please keep me updated with news, updates,\nand offers from Team",
                            style: poppinsRegular.copyWith(
                              fontSize: 7.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: Switch(
                          activeColor: AppColors.white,
                          inactiveThumbColor: AppColors.white,
                          trackColor: MaterialStateProperty.all(
                              AppColors.gradientStart),
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          value: controller.teamNotification,
                          onChanged: (value) {
                            controller.teamNotification = value;
                            controller.update();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
