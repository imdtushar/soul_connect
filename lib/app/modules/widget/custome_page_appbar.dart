import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';

class CustomPageAppBar extends StatelessWidget {
  final String title;
  final bool? lastOption;

  const CustomPageAppBar(
      {super.key, required this.title, this.lastOption = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: Stack(
            children: [
              Positioned(
                left: 23.w,
                bottom: 0,
                top: 0,
                child: CustomImageView(
                  svgPath: ImageConstant.backButton,
                  onTap: () => Get.back(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: poppinsMedium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              if (lastOption == true)
                Positioned(
                  right: 23.w,
                  bottom: 0,
                  top: 0,
                  child: CustomImageView(
                    height: 50,
                    svgPath: ImageConstant.addBlockContact,
                    onTap: () {},
                  ),
                ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.dividerLine,
          thickness: 0.5,
        ),
      ],
    );
  }
}
