import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.inputFormatters,
    required this.isPasswordField,
  }) : super(key: key) {
    showPassword = isPasswordField;
  }

  final Alignment? alignment;

  final bool isPasswordField;

  final double? width;

  bool showPassword = false;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final List<TextInputFormatter>? inputFormatters;

  final FormFieldValidator<String>? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        height: 40,
        width: widget.width ?? double.maxFinite,
        margin: widget.margin,
        child: TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.black,
          focusNode: widget.focusNode ?? FocusNode(),
          autofocus: widget.autofocus!,
          inputFormatters: widget.inputFormatters,
          style: widget.textStyle ??
              poppinsMediumItalic.copyWith(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
          obscureText: widget.showPassword,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
          validator: widget.validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ??
            poppinsMediumItalic.copyWith(
              fontSize: 14.sp,
              color: AppColors.black.withOpacity(0.5),
            ),
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.suffix ??
            (widget.isPasswordField
                ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.showPassword = !widget.showPassword;
                      });
                    },
                    child: SvgPicture.asset(
                      widget.showPassword
                          ? "assets/images/pass_view.svg"
                          : "assets/images/pass_hide.svg",
                      fit: BoxFit.none,
                      height: widget.showPassword ? 10.h : 18.h,
                      width: widget.showPassword ? 18.w : 22.w,
                    ),
                  )
                : SizedBox(
                    height: 15.w,
                  )),
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(9.h),
        fillColor: widget.fillColor,
        filled: widget.filled,
        border: widget.borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black.withOpacity(0.4),
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black.withOpacity(0.4),
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.gradientStart),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlackTL5 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.5),
          width: 1,
        ),
      );

  static OutlineInputBorder get fillPrimaryContainer => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide.none,
      );
}
