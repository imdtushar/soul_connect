import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/matches/matches_screen_binding.dart';

import '../../routes/router_name.dart';

class MatchesScreen extends BaseView<MatchesScreenController> {
  MatchesScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Well-liked",
                      style: poppinsSemiBold.copyWith(
                        fontSize: 34.sp,
                        color: AppColors.black,
                      ),
                    ),
                    SvgPicture.asset(
                      ImageConstant.btnFilterIcon,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "This is a list of Well-liked",
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 28.h,
              // ),
              // Row(
              //   children: [
              //     Flexible(
              //       child: Divider(
              //         height: 1,
              //         thickness: 1,
              //         color: AppColors.black.withOpacity(0.5),
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 5.w),
              //       child: Text(
              //         "This Week",
              //         style: poppinsRegular.copyWith(
              //           fontSize: 12.sp,
              //           color: AppColors.black.withOpacity(0.7),
              //         ),
              //       ),
              //     ),
              //     Flexible(
              //       child: Divider(
              //         height: 1,
              //         thickness: 1,
              //         color: AppColors.black.withOpacity(0.5),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 250.h,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Leilani, 19",
                                    style: poppinsBold.copyWith(
                                      fontSize: 20.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(0.8),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        ImageConstant.closeButton,
                                        height: 26.w,
                                        width: 26.w,
                                      ),
                                      Container(
                                        height: 50.h,
                                        width: 2.w,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.white.withOpacity(0.8),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          FocusScope.of(context).unfocus();
                                          Get.toNamed(RouterName.otherProfile);
                                        },
                                        child: Image.asset(
                                          ImageConstant.likeButton,
                                          height: 26.w,
                                          width: 26.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
