import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/utils/validation_functions.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/login/login_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class LoginScreen extends BaseView<LoginScreenController> {
  LoginScreen({super.key});

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
            child:   Container(
              width: double.infinity,
              color: AppColors.gray100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  CustomImageView(
                    svgPath: ImageConstant.loginBgImg,
                  ),
                  SizedBox(height: height * 0.04),
                  BodyPartOfUi(controller: controller),
                ],
              ),
            ),
          )
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
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 26.h,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "Welcome ! Please log in to continue your dating journey.",
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
          Text(
            'Sign up or Log In',
            style: poppinsSemiBold.copyWith(
              fontSize: 25.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const SocialMediaLogin(),
          SizedBox(
            height: 30.h,
          ),
          const ORUi(),
          SizedBox(
            height: 30.h,
          ),
          CustomTextFormField(
            controller: controller.emailController,
            hintText: "Email",
            autofocus: false,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "Please enter valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            autofocus: false,
            controller: controller.passwordController,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "Please enter valid password";
              }
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            onTap: () {},
            text: "Continue with email",
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
            buttonTextStyle: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(AppColors.gray100),
              ),
              onPressed: () {
                Get.toNamed(RouterName.signup);
              },
              child: Text(
                'Sign up?',
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
