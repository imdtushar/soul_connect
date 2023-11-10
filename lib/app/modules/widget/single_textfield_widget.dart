import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import '../../core/values/text_styles.dart';
import 'custom_button_style.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';
import 'custome_page_appbar.dart';

class SingleTextFieldWidget extends StatelessWidget {
  const SingleTextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.onTap,
  });

  final String title, hint;
  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomPageAppBar(title: title),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    isPasswordField: false,
                    controller: controller,
                    hintText: hint,
                    autofocus: false,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 60.h),
                  CustomElevatedButton(
                    onTap: onTap,
                    text: 'Save',
                    buttonStyle: CustomButtonStyles.none,
                    decoration:
                        CustomButtonStyles.gradientOnErrorToPinkDecoration,
                    buttonTextStyle: poppinsMedium.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
