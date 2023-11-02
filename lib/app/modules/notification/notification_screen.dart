import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/notification/notification_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class NotificationScreen extends BaseView<NotificationScreenController> {
  NotificationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageAppBar(title: "Notification"),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
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
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouterName.email);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SvgPicture.asset(ImageConstant.arrow),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.dividerLine1,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouterName.pushNotification);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Push Notification",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SvgPicture.asset(ImageConstant.arrow),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.dividerLine1,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouterName.teamNotification);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Team",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SvgPicture.asset(ImageConstant.arrow),
                        ],
                      ),
                    ),
                  ),
                ],
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
