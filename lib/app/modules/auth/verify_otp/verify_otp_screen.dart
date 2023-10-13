import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/verify_otp/verify_otp_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/widget/custom_pin_code_text_field.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class VerifyOtpScreen extends BaseView<VerifyOtpScreenController> {
  VerifyOtpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget vBuilder(BuildContext context, controller) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                color: AppColors.gray100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 8.h,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.backButton,
                        onTap: () => Get.back(),
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    CustomImageView(
                      svgPath: ImageConstant.otpVerifyBg,
                      alignment: Alignment.center,
                      height: height * 0.32,
                    ),
                    SizedBox(height: height * 0.1),
                    BodyPartOfUi(controller: controller),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

//TODO Body Part Of UI
class BodyPartOfUi extends StatelessWidget {
  final VerifyOtpScreenController controller;

  const BodyPartOfUi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 26.h,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Verify OTP',
              style: poppinsSemiBold.copyWith(
                fontSize: 25.sp,
                color: AppColors.black,
              ),
            ),
          ),
          Obx(
            () => CustomPinCodeTextField(
              context: context,
              margin: EdgeInsets.only(
                left: 20.w,
                top: 27.h,
                right: 21.w,
              ),
              controller: controller.otpController.value,
              onChanged: (value) {},
            ),
          ),
          Center(
            child: Text(
              "Didn’t get OTP yet?",
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: AppColors.paragraphHint,
              ),
            ),
          ),
          Center(
            child: Text(
              "Send again",
              style: poppinsMedium.copyWith(
                fontSize: 15.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomElevatedButton(
            onTap: () => Get.toNamed(RouterName.newPassword),
            text: "Verify",
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
