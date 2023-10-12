import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.margin,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(key: key);

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  final Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          cursorColor: AppColors.black,
          length: 6,

          keyboardType: TextInputType.number,
          textStyle: textStyle ??
              poppinsMedium.copyWith(
                fontSize: 24.sp,
                color: AppColors.black,
              ),
          hintStyle: hintStyle ??
              poppinsMedium.copyWith(
                fontSize: 24.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          pinTheme: PinTheme(
            fieldHeight: 45.h,
            fieldWidth: 39.h,

            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8.r),
            inactiveColor: AppColors.black.withOpacity(0.5),
            activeColor: AppColors.black.withOpacity(0.5),
            selectedColor: AppColors.black.withOpacity(0.5),
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      );
}
