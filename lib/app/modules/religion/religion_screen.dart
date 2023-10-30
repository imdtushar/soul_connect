import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/religion/religion_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class ReligionScreen extends BaseView<ReligionScreenController> {
  ReligionScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: AppString.religionLbl,
              showSkip: true,
              skipOnTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(RouterName.smoke);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            BodyUi(
              controller: controller,
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomElevatedButton(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(RouterName.smoke);
                },
                text: AppString.nextBtn,
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
  final ReligionScreenController controller;

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
        itemCount: controller.likeData.length,
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
                    "${controller.likeData[index]}",
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