import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/gender/gender_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class GenderScreen extends BaseView<GenderScreenController> {
  GenderScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: "What’s your\nGender? ",
              showSkip: true,
              skipOnTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(RouterName.location);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genderOption("🙎‍♂️", "Male", controller.isSelected),
                SizedBox(width: 22.w),
                genderOption("🙎‍♀️", "Female", !controller.isSelected),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Other",
                style: poppinsMedium.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                  decoration: TextDecoration.underline,
                ),
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
                  Get.toNamed(RouterName.location);
                },
                text: "Next",
                buttonStyle: CustomButtonStyles.none,
                decoration:
                CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderOption(String emoji, String label, bool isSelected) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.selectedValue();
      },
      child: Container(
        height: 116.w,
        width: 116.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          border: Border.all(
            color: isSelected ? AppColors.gradientStart : Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: poppinsBold.copyWith(
                fontSize: 60,
              ),
            ),
            Text(
              label,
              style: poppinsMedium.copyWith(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
