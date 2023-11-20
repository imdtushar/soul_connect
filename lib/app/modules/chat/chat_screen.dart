import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'chat_screen_binding.dart';

class ChatScreen extends BaseView<ChatScreenController> {
  ChatScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'Messages',
              style: poppinsSemiBold.copyWith(
                fontSize: 30.sp,
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 21.w,
            ),
            child: CustomTextFormField(
              hintStyle: poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.black.withOpacity(0.2),
              ),
              hintText: 'Search',
              autofocus: false,
              isPasswordField: false,
              borderDecoration: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: const BorderSide(color: Colors.white),
              ),
              textInputAction: TextInputAction.done,
              fillColor: Colors.white,
              filled: true,
              prefix: SvgPicture.asset(
                "assets/images/search_home.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 54.w,
                        width: 54.w,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  color: AppColors.gradientStart,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: const NetworkImage(
                                  "https://images.unsplash.com/photo-1528709024086-98a7672e0b9d?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                ),
                                radius: 24.r,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset(
                                  "assets/images/add_story_icon.svg"),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'My status',
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    Container(
                      height: 54,
                      padding: EdgeInsets.all(3.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                          color: AppColors.gradientStart,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1528709024086-98a7672e0b9d?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        radius: 24.r,
                      ),
                    ),
                    Text(
                      'Yash Bheda',
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 30.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(42.r),
                  topLeft: Radius.circular(42.r),
                ),
                color: AppColors.white,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 50.w,
                        width: 50.w,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1528709024086-98a7672e0b9d?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                              radius: 24.r,
                            ),
                            Positioned(
                              right: 4.w,
                              bottom: 6.h,
                              child: Container(
                                width: 8.w,
                                height: 8.w,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF0FE16D),
                                  shape: OvalBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Alex Costa",
                                  style: poppinsRegular.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  "2 min ago",
                                  style: poppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.chatColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "How are you today?",
                                  style: poppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.chatColor,
                                  ),
                                ),
                                Container(
                                  height: 22.w,
                                  width: 22.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      AppColors.gradientStart,
                                      AppColors.gradientEnd,
                                    ]),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Text(
                                    '3',
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
