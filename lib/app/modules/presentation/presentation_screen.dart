import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/presentation/presentation_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';

class PresentationScreen extends BaseView<PresentationScreenController> {
  PresentationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              text: "It’s all about\nPresentation 📸",
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "• Upload at least 6 photos",
                style: poppinsMedium.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            const BodyUI(),
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
                  // Get.toNamed(RouterName.presentation);
                },
                text: "Next",
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BodyUI extends StatelessWidget {
  const BodyUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 18.0,
        childAspectRatio: 0.8,

        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          width: 108.w,
          height: 150.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.gray100,
            border: Border.all(color: AppColors.gradientStart),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0C000000),
                blurRadius: 4.r,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Icon(
            Icons.add_outlined,
            color: AppColors.gradientStart,
            size: 34,
          ),
        );
      },
    );
  }
}
