import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'package:soul_connect/app/routes/router_name.dart';

import 'account_setting_screen_binding.dart';

class AccountSettingScreen extends BaseView<AccountSettingScreenController> {
  AccountSettingScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPageAppBar(title: "Account Settings"),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w),
              child: Text(
                'Phone Number',
                style: poppinsSemiBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 13.h,
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
                      Get.toNamed(RouterName.editNumber);
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
                            "8200663576",
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
