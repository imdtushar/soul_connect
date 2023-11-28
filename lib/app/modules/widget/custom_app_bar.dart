import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import '../../core/utils/image_constant.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? skipOnTap;
  final String text;
  final bool showSkip;
  final Widget? skipWidget;
  final bool showDivider;

  const CustomAppBar({
    super.key,
    this.skipOnTap,
    required this.text,
    this.showSkip = false,
    this.skipWidget,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 8.h,
          ),
          child: Row(
            mainAxisAlignment: showSkip
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.backButton,
                onTap: () => Get.back(),
              ),
              if (showSkip)
                InkWell(
                    onTap: skipOnTap,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: skipWidget),
            ],
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Text(
            text,
            style: poppinsSemiBold.copyWith(
              fontSize: 25.sp,
              color: AppColors.black,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        if (showDivider)
          const Divider(
            color: AppColors.dividerColor,
            height: 1,
          ),
      ],
    );
  }
}
