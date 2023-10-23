import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/age/age_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class AgeScreen extends BaseView<AgeScreenController> {
  AgeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const CustomAppBar(
            text: AppString.yourBirthDateLbl,
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 260.h,
            child: CupertinoDatePicker(
              initialDateTime: controller.date,
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              showDayOfWeek: true,
              onDateTimeChanged: (DateTime newDate) {
                controller.date = newDate;
                controller.update();
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Divider(
              color: AppColors.dividerColor,
              height: 1,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Age ${controller.differenceInYears}",
            style: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          Text(
            AppString.changeLater,
            style: poppinsMedium.copyWith(
              fontSize: 10.sp,
              color: AppColors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: CustomElevatedButton(
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(RouterName.likeToDate);
              },
              text: AppString.nextBtn,
              buttonStyle: CustomButtonStyles.none,
              decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
              buttonTextStyle: poppinsMedium.copyWith(
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
