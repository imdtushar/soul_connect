import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/utils/validation_functions.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/create_new_password/new_password_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/common_textfield.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';

class NewPasswordScreen extends BaseView<NewPasswordScreenController> {
  NewPasswordScreen({super.key});

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
                    SizedBox(height: height * 0.04),
                    CustomImageView(
                      svgPath: ImageConstant.createPasswordBG,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: height * 0.04),
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
  final NewPasswordScreenController controller;

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
        bottom: 20.h,
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
              'Create a new password',
              style: poppinsSemiBold.copyWith(
                fontSize: 25.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CommonTextField(
            label: 'Create Password',
            controller: controller.passwordController,
            hintText: 'Create Password',
            isPasswordField: true,
            prefixImage: ImageConstant.passwordIcTextField,
            prefixHeight: 4.h,
            prefixWidth: 2,
            textInputType: TextInputType.visiblePassword,
            returnMsg: 'Please enter valid password',
            textInputAction: TextInputAction.next,
          ),
          CommonTextField(
            label: 'Confirm Password',
            controller: controller.confirmPasswordController,
            hintText: 'Confirm Password',
            isPasswordField: true,
            prefixImage: ImageConstant.passwordIcTextField,
            prefixHeight: 4.h,
            prefixWidth: 2,
            textInputType: TextInputType.visiblePassword,
            returnMsg: 'Please enter valid password',
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 10.h),
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
        ],
      ),
    );
  }
}
