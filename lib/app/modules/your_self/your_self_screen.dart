import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'package:soul_connect/app/modules/your_self/your_self_screen_binding.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class YourSelfScreen extends BaseView<YourSelfScreenController> {
  YourSelfScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              text: "Introduce\nyourself 👋",
            ),
            BodyUI(controller: controller),
          ],
        ),
      ),
    );
  }
}

class BodyUI extends StatelessWidget {
  final YourSelfScreenController controller;

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
          // Usage in the BodyUI widget
          buildTextFormField('First Name', controller.firstNameController),
          buildTextFormField('Last Name', controller.lastNameController),
          SizedBox(height: 50.h),
          CustomElevatedButton(
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.toNamed(RouterName.sexualScreen);
            },
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

Widget buildTextFormField(String label, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          bottom: 4.h,
        ),
        child: Text(
          label,
          style: poppinsRegular.copyWith(
            fontSize: 14.sp,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
      ),
      CustomTextFormField(
        isPasswordField: false,
        controller: controller,
        hintText: "",
        autofocus: false,
        textInputType: TextInputType.text,
      ),
      SizedBox(height: 10.h),
    ],
  );
}
