import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/login/login_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/common_textfield.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class LoginScreen extends BaseView<LoginScreenController> {
  LoginScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.gray100,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomImageView(
              svgPath: ImageConstant.loginBgImg,
              width: double.infinity,
              height: 210.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BodyPartOfUi(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO Body Part Of UI
class BodyPartOfUi extends StatelessWidget {
  final LoginScreenController controller;

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              AppString.welcome,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              AppString.signupLogin ,
              style: poppinsSemiBold.copyWith(
                fontSize: 25.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const SocialMediaLogin(),
          SizedBox(
            height: 15.h,
          ),
          const ORUi(),
          SizedBox(
            height: 16.h,
          ),
          CommonTextField(
            controller: controller.emailController,
            hintText: AppString.emailHint,
            isPasswordField: false,
            prefixImage: ImageConstant.emailIcTextField,
            prefixWidth: 10.w,
            textInputType: TextInputType.emailAddress,
            returnMsg: 'Please enter valid email',
            textInputAction: TextInputAction.next,
          ),
          CommonTextField(
            controller: controller.passwordController,
            hintText: AppString.passHint,
            isPasswordField: true,
            prefixImage: ImageConstant.passwordIcTextField,
            prefixHeight: 8.h,
            textInputType: TextInputType.visiblePassword,
            returnMsg: 'Please enter valid password',
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.toNamed(RouterName.yourSelf);
            },
            text: AppString.continueBtn,
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
            buttonTextStyle: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.gray100),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(RouterName.forgotPassword);
                },
                child: Text(
                  AppString.forgotPassBtn,
                  style: poppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.gray100),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(RouterName.signup);
                },
                child: Text(
                  AppString.signUpBtn,
                  style: poppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//TODO OR And Divider UI
class ORUi extends StatelessWidget {
  const ORUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.containerBg,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: Text(
            'or',
            style: poppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.containerBg,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.containerBg,
          ),
        ),
      ],
    );
  }
}

//TODO SocialMedia UI
class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialMediaButton(
          image: ImageConstant.phoneIcContainer,
          onTap: () => Get.toNamed(RouterName.mobileLogin),
        ),
        SocialMediaButton(
          image: ImageConstant.googleWithLogin,
        ),
        SocialMediaButton(
          image: ImageConstant.appleLogin,
        ),
      ],
    );
  }
}

//TODO SocialMediaButton Common Widget
class SocialMediaButton extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;

  const SocialMediaButton({
    super.key,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 10.h,
      ),
      decoration: ShapeDecoration(
        color: AppColors.gray100,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            color: AppColors.containerBg,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: CustomImageView(
        svgPath: image,
        onTap: onTap,
      ),
    );
  }
}
