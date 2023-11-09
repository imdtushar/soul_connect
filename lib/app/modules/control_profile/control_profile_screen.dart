import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import '../widget/custome_page_appbar.dart';
import 'control_profile_binding.dart';

class ControlProfileScreen extends BaseView<ControlProfileController> {
  ControlProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageAppBar(
              title: "Control Your Profile",
            ),
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
                          "Don’t Show Age",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Switch(
                            inactiveThumbColor: AppColors.white,
                            activeColor: AppColors.white,
                            trackColor: MaterialStateProperty.all(
                                AppColors.gradientStart),
                            trackOutlineColor:
                            MaterialStateProperty.all(Colors.transparent),
                            value: controller.showDistance,
                            onChanged: (value) {
                              controller.showDistance = value;
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
                          "Don’t Show  Distance",
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
                            activeColor: AppColors.white,
                            trackOutlineColor:
                            MaterialStateProperty.all(Colors.transparent),
                            value: controller.showAge,
                            onChanged: (value) {
                              controller.showAge = value;
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
    );
  }
}
