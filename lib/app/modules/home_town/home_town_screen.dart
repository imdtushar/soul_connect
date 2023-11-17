import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/home_town/home_town_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class HomeTownScreen extends BaseView<HomeTownScreenController> {
  HomeTownScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: AppString.homeTownLbl,
              showSkip: true,
              skipOnTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(RouterName.workScreen);
              },
              skipWidget: Text(
                "Skip",
                style: poppinsRegular.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            BodyUI(controller: controller),
          ],
        ),
      ),
    );
  }
}

class BodyUI extends StatelessWidget {
  final HomeTownScreenController controller;

  const BodyUI({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomTextFormField(
            isPasswordField: false,
            controller: controller.homeTownController,
            hintText: AppString.homeTownHint,
            autofocus: false,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 60.h),
          CustomElevatedButton(
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.toNamed(RouterName.workScreen);
            },
            text: AppString.nextBtn,
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
            buttonTextStyle: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
