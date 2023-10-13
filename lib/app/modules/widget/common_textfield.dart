import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/utils/validation_functions.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool isPasswordField;
  final Widget? prefix;
  final bool prefixIsImage;
  final String? prefixImage;
  final double? prefixHeight;
  final double? prefixWidth;
  final TextInputType textInputType;
  final String? returnMsg;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const CommonTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    required this.isPasswordField,
    this.prefixImage,
    this.prefixHeight,
    this.prefixWidth,
    required this.textInputType,
    this.returnMsg,
    this.prefixIsImage = true,
    this.prefix,
    this.inputFormatters,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
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
          isPasswordField: isPasswordField,
          controller: controller,
          hintText: hintText,
          autofocus: false,
          prefix: prefixIsImage
              ? Image.asset(
                  prefixImage ?? "",
                  // ImageConstant.emailIcTextField,
                  width: prefixWidth,
                  height: prefixHeight,
                )
              : prefix,
          textInputType: textInputType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          // textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return returnMsg;
            }
            return null;
          },
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
