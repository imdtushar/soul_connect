import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/location/location_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';

class LocationScreen extends BaseView<LocationScreenController> {
  LocationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              text: "Location📍",
              showSkip: true,
              skipOnTap: () {
                FocusScope.of(context).unfocus();
                // Get.toNamed(RouterName.drink);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Let the app locate you to provide best searched results around you",
                style: poppinsRegular.copyWith(
                  fontSize: 17.sp,
                  color: AppColors.black.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Current Location",
                style: poppinsMedium.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
