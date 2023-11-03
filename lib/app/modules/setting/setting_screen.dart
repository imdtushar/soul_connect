import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/setting/setting_screen_bindng.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class SettingScreen extends BaseView<SettingScreenController> {
  SettingScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageAppBar(title: "Settings"),
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
              child: settingList(),
            ),
          ],
        ),
      ),
    );
  }

  Column settingList() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(RouterName.notification);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImageConstant.notification),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Notification",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
          onTap: (){
            Get.toNamed(RouterName.changePassword);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImageConstant.changePassword),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Change Password",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
          onTap: (){
            Get.toNamed(RouterName.accountSetting);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImageConstant.accountSetting),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Account Settings",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.privacy),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Privacy Policy",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
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
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.help),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Help & Support",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
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
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.feedback),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Feedback",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.dividerLine1,
        ),
        InkWell(
          onTap: (){
            Get.toNamed(RouterName.blockContact);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImageConstant.block),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Block Contact",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.about),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "About us",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
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
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.logout),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Logout",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.gradientStart,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
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
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageConstant.delete),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Delete Account",
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.gradientStart,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(ImageConstant.arrow),
            ],
          ),
        ),
      ],
    );
  }
}
