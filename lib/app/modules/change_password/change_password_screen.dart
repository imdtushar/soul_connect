import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/common_textfield.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'change_password_screen_binding.dart';

class ChangePasswordScreen extends BaseView<ChangePasswordScreenController> {
  ChangePasswordScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageAppBar(title: "Change Password"),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: CommonTextField(
                controller: controller.currentPassword,
                hintText: AppString.currentPassHint,
                isPasswordField: false,
                prefixImage: ImageConstant.passwordIcTextField,
                prefixHeight: 4.h,
                prefixWidth: 2,
                textInputType: TextInputType.visiblePassword,
                returnMsg: 'Please enter valid password',
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CommonTextField(
                controller: controller.createPassword,
                hintText: AppString.createPassHint,
                isPasswordField: true,
                prefixImage: ImageConstant.passwordIcTextField,
                prefixHeight: 4.h,
                prefixWidth: 2,
                textInputType: TextInputType.visiblePassword,
                returnMsg: 'Please enter valid password',
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CommonTextField(
                controller: controller.confirmPassword,
                hintText: AppString.confirmPassHint,
                isPasswordField: true,
                prefixImage: ImageConstant.passwordIcTextField,
                prefixHeight: 4.h,
                prefixWidth: 2,
                textInputType: TextInputType.visiblePassword,
                returnMsg: 'Please enter valid password',
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomElevatedButton(
                onTap: () {},
                text: AppString.changePassLbl,
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
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
}
