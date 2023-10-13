import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/utils/validation_functions.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/signup/signup_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';

class SignupScreen extends BaseView<SignupScreenController> {
  SignupScreen({super.key});

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
                    SizedBox(height: height * 0.01),
                    CustomImageView(
                      svgPath: ImageConstant.signupBg,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: height * 0.034),
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
  final SignupScreenController controller;

  const BodyPartOfUi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 20.h,
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
              'Sign Up',
              style: poppinsSemiBold.copyWith(
                fontSize: 25.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              bottom: 4.h,
            ),
            child: Text(
              'Email',
              style: poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ),
          CustomTextFormField(
            isPasswordField: false,
            controller: controller.emailController,
            hintText: "Email",
            autofocus: false,
            prefix: Image.asset(
              ImageConstant.emailIcTextField,
              width: 10.w,
            ),
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "Please enter valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              bottom: 4.h,
            ),
            child: Text(
              'Password',
              style: poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ),
          CustomTextFormField(
            isPasswordField: true,
            autofocus: false,
            controller: controller.passwordController,
            hintText: "Password",
            prefix: Image.asset(
              ImageConstant.passwordIcTextField,
              height: 8.h,
            ),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "Please enter valid password";
              }
              return null;
            },
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              bottom: 4.h,
            ),
            child: Text(
              'Confirm Password',
              style: poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ),
          CustomTextFormField(
            isPasswordField: true,
            controller: controller.confirmPasswordController,
            hintText: 'Confirm Password',
            prefix: Image.asset(
              ImageConstant.passwordIcTextField,
              height: 8.h,
            ),
            autofocus: false,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "Please enter valid password";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            onTap: () {},
            text: "Next",
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
            buttonTextStyle: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Center(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(AppColors.gray100),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Having trouble signing in?',
                style: poppinsRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
