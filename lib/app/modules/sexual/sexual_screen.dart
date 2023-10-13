import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/sexual/sexual_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';

class SexualScreen extends BaseView<SexualScreenController> {
  SexualScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const CustomAppBar(
                  text: "Your Sexual\nOrientation? ☑️",
                ),
                SizedBox(
                  height: 15.h,
                ),
                BodyUi(controller: controller),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
            Positioned(
              bottom: 10.h,
              left: 20.w,
              right: 20.w,
              child: CustomElevatedButton(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  // Get.toNamed(RouterName.sexualScreen);
                },
                text: "Next",
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ],


        ),
      ),
    );
  }
}

class BodyUi extends StatelessWidget {
  final SexualScreenController controller;

  const BodyUi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 15.h,
          bottom: 15.h,
        ),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.h,
          );
        },
        itemCount: 16,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: controller.selectedValue == index
                  ? BorderRadius.circular(5.r)
                  : BorderRadius.circular(0),
              color: controller.selectedValue == index
                  ? AppColors.white
                  : Colors.transparent,
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                controller.selectIndex(index);
              },
              child: Row(
                mainAxisAlignment: controller.selectedValue == index
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    'Straight',
                    style: poppinsRegular.copyWith(
                      fontSize: 15.sp,
                      color: controller.selectedValue == index
                          ? AppColors.black
                          : AppColors.dividerColor,
                    ),
                  ),
                  if (controller.selectedValue == index)
                    CustomImageView(
                      svgPath: ImageConstant.checkImg,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
