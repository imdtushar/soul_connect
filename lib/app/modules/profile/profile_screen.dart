import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class ProfileScreen extends BaseView<ProfileScreenController> {
  ProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1582391988484-3f1691bc1401?auto=format&fit=crop&q=80&w=2093&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            Get.toNamed(RouterName.setting);
                          },
                          child: SvgPicture.asset(ImageConstant.settingButton),
                        ),
                        SvgPicture.asset(ImageConstant.editButton),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 25.w,
                    right: 0,
                    bottom: 26.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alex Costa",
                          style: poppinsRegular.copyWith(
                            fontSize: 20.sp,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "Model",
                          style: poppinsRegular.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
              ),
              child: Text(
                "Your Photos",
                style: poppinsBold.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 21.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1525249181835-95a4c9168268?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      height: 97.h,
                      width: 78.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alex Costa",
                        style: poppinsRegular.copyWith(
                          fontSize: 24.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Professional model",
                        style: poppinsRegular.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    ImageConstant.sendButton,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: poppinsRegular.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Los Angeles,California",
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 34.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: AppColors.redColorsLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.currentLocation,
                        ),
                        Text(
                          " 1 km",
                          style: poppinsRegular.copyWith(
                              fontSize: 12.sp, color: AppColors.gradientStart),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
              ),
              child: Text(
                "About",
                style: poppinsRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
              ),
              child: ReadMoreText(
                'My name is Alex Costa and I enjoy meeting new people and finding ways . My name is Alex Costa and I enjoy meeting new people and finding ways',
                trimLines: 2,
                colorClickableText: AppColors.gradientStart,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: poppinsRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.gradientStart,
                ),
                lessStyle: poppinsRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.gradientStart,
                ),
                style: poppinsRegular.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.black.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
